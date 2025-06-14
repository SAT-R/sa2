// Adapted from https://gist.github.com/Normmatt/e00ea0c5da509568959bde52754f213e and https://gist.github.com/Normmatt/f4e768f0e1c30dea3835098db744297a

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dump_sound
{
    class SoundDumper
    {
        static int MPlayTableAdr = 0x02016d5c;
        static int NumMPlayers = 4;
        static int SongTableAdr = 0x02016d8c;
        static int NumSongs = 26;

        static int VoiceGroupEndAdr = 0x02016ccc;
        static int KeySplitEndAdr = 0x02016d58;

        static SortedDictionary<int, string> soundInfo = new SortedDictionary<int, string>();
        static byte[] rom;
        static List<int> voicegroups = new List<int>();
        static List<int> keysplits = new List<int>();
        static List<int> offsets = new List<int>();

        static Dictionary<int, string> MML = new Dictionary<int, string>()
        {
            {0x80, "W00" },
            {0x81, "W01" },
            {0x82, "W02" },
            {0x83, "W03" },
            {0x84, "W04" },
            {0x85, "W05" },
            {0x86, "W06" },
            {0x87, "W07" },
            {0x88, "W08" },
            {0x89, "W09" },
            {0x8A, "W10" },
            {0x8B, "W11" },
            {0x8C, "W12" },
            {0x8D, "W13" },
            {0x8E, "W14" },
            {0x8F, "W15" },
            {0x90, "W16" },
            {0x91, "W17" },
            {0x92, "W18" },
            {0x93, "W19" },
            {0x94, "W20" },
            {0x95, "W21" },
            {0x96, "W22" },
            {0x97, "W23" },
            {0x98, "W24" },
            {0x99, "W28" },
            {0x9A, "W30" },
            {0x9B, "W32" },
            {0x9C, "W36" },
            {0x9D, "W40" },
            {0x9E, "W42" },
            {0x9F, "W44" },
            {0xA0, "W48" },
            {0xA1, "W52" },
            {0xA2, "W54" },
            {0xA3, "W56" },
            {0xA4, "W60" },
            {0xA5, "W64" },
            {0xA6, "W66" },
            {0xA7, "W68" },
            {0xA8, "W72" },
            {0xA9, "W76" },
            {0xAA, "W78" },
            {0xAB, "W80" },
            {0xAC, "W84" },
            {0xAD, "W88" },
            {0xAE, "W90" },
            {0xAF, "W92" },
            {0xB0, "W96" },
            {0xB1, "FINE" },
            {0xB2, "GOTO" },
            {0xB3, "PATT" },
            {0xB4, "PEND" },
            {0xB5, "REPT" },
            {0xB9, "MEMACC" },
            {0xBA, "PRIO" },
            {0xBB, "TEMPO" },
            {0xBC, "KEYSH" },
            {0xBD, "VOICE" },
            {0xBE, "VOL" },
            {0xBF, "PAN" },
            {0xC0, "BEND" },
            {0xC1, "BENDR" },
            {0xC2, "LFOS" },
            {0xC3, "LFODL" },
            {0xC4, "MOD" },
            {0xC5, "MODT" },
            {0xC8, "TUNE" },
            {0xCD, "XCMD" },
            {0x08, "xIECV" },
            {0x09, "xIECL" },
            {0xCE, "EOT" },
            {0xCF, "TIE" },
            {0xD0, "N01" },
            {0xD1, "N02" },
            {0xD2, "N03" },
            {0xD3, "N04" },
            {0xD4, "N05" },
            {0xD5, "N06" },
            {0xD6, "N07" },
            {0xD7, "N08" },
            {0xD8, "N09" },
            {0xD9, "N10" },
            {0xDA, "N11" },
            {0xDB, "N12" },
            {0xDC, "N13" },
            {0xDD, "N14" },
            {0xDE, "N15" },
            {0xDF, "N16" },
            {0xE0, "N17" },
            {0xE1, "N18" },
            {0xE2, "N19" },
            {0xE3, "N20" },
            {0xE4, "N21" },
            {0xE5, "N22" },
            {0xE6, "N23" },
            {0xE7, "N24" },
            {0xE8, "N28" },
            {0xE9, "N30" },
            {0xEA, "N32" },
            {0xEB, "N36" },
            {0xEC, "N40" },
            {0xED, "N42" },
            {0xEE, "N44" },
            {0xEF, "N48" },
            {0xF0, "N52" },
            {0xF1, "N54" },
            {0xF2, "N56" },
            {0xF3, "N60" },
            {0xF4, "N64" },
            {0xF5, "N66" },
            {0xF6, "N68" },
            {0xF7, "N72" },
            {0xF8, "N76" },
            {0xF9, "N78" },
            {0xFA, "N80" },
            {0xFB, "N84" },
            {0xFC, "N88" },
            {0xFD, "N90" },
            {0xFE, "N92" },
            {0xFF, "N96" },
        };

        static string[] MemSet =
        {
            "mem_set",
            "mem_add",
            "mem_sub",
            "mem_mem_set",
            "mem_mem_add",
            "mem_mem_sub",
            "mem_beq",
            "mem_bne",
            "mem_bhi",
            "mem_bhs",
            "mem_bls",
            "mem_blo",
            "mem_mem_beq",
            "mem_mem_bne",
            "mem_mem_bhi",
            "mem_mem_bhs",
            "mem_mem_bls",
            "mem_mem_blo",
        };

        static string[] Keys =
        {
            "CnM2",
            "CsM2",
            "DnM2",
            "DsM2",
            "EnM2",
            "FnM2",
            "FsM2",
            "GnM2",
            "GsM2",
            "AnM2",
            "AsM2",
            "BnM2",
            "CnM1",
            "CsM1",
            "DnM1",
            "DsM1",
            "EnM1",
            "FnM1",
            "FsM1",
            "GnM1",
            "GsM1",
            "AnM1",
            "AsM1",
            "BnM1",
            "Cn0",
            "Cs0",
            "Dn0",
            "Ds0",
            "En0",
            "Fn0",
            "Fs0",
            "Gn0",
            "Gs0",
            "An0",
            "As0",
            "Bn0",
            "Cn1",
            "Cs1",
            "Dn1",
            "Ds1",
            "En1",
            "Fn1",
            "Fs1",
            "Gn1",
            "Gs1",
            "An1",
            "As1",
            "Bn1",
            "Cn2",
            "Cs2",
            "Dn2",
            "Ds2",
            "En2",
            "Fn2",
            "Fs2",
            "Gn2",
            "Gs2",
            "An2",
            "As2",
            "Bn2",
            "Cn3",
            "Cs3",
            "Dn3",
            "Ds3",
            "En3",
            "Fn3",
            "Fs3",
            "Gn3",
            "Gs3",
            "An3",
            "As3",
            "Bn3",
            "Cn4",
            "Cs4",
            "Dn4",
            "Ds4",
            "En4",
            "Fn4",
            "Fs4",
            "Gn4",
            "Gs4",
            "An4",
            "As4",
            "Bn4",
            "Cn5",
            "Cs5",
            "Dn5",
            "Ds5",
            "En5",
            "Fn5",
            "Fs5",
            "Gn5",
            "Gs5",
            "An5",
            "As5",
            "Bn5",
            "Cn6",
            "Cs6",
            "Dn6",
            "Ds6",
            "En6",
            "Fn6",
            "Fs6",
            "Gn6",
            "Gs6",
            "An6",
            "As6",
            "Bn6",
            "Cn7",
            "Cs7",
            "Dn7",
            "Ds7",
            "En7",
            "Fn7",
            "Fs7",
            "Gn7",
            "Gs7",
            "An7",
            "As7",
            "Bn7",
            "Cn8",
            "Cs8",
            "Dn8",
            "Ds8",
            "En8",
            "Fn8",
            "Fs8",
            "Gn8",
        };

        static Dictionary<string, bool> SongsWithTrackAlignment = new Dictionary<string, bool>()
        {
            {"song785", true},
            {"song805", true},
            {"song806", true},
            {"song807", true},
            {"song811", true},
            {"song815", true},
            {"song816", true},
            {"song962", true},
        };

        static byte ReadU8(int ofs)
        {
            if (ofs > 0x20000C0)
                ofs -= 0x20000C0;

            return rom[ofs];
        }

        static ushort ReadU16(int ofs)
        {
            if (ofs > 0x20000C0)
                ofs -= 0x20000C0;

            return BitConverter.ToUInt16(rom, ofs);
        }

        static int ReadU32(int ofs)
        {
            if (ofs > 0x20000C0)
                ofs -= 0x20000C0;

            return BitConverter.ToInt32(rom, ofs);
        }

        static string PrintMPlayTable(int ofs)
        {
            if (!offsets.Contains(ofs)) offsets.Add(ofs);
            var sb = new StringBuilder();

            sb.Append("\t.align 2\n");
            sb.AppendFormat("\t.global gMPlayTable\n");
            sb.AppendFormat("gMPlayTable:\t@ 0x{0:X8}\n", ofs);
            for (int i = 0; i < NumMPlayers; i++)
            {
                var playInfo = ReadU32(ofs + 0);
                var trackInfo = ReadU32(ofs + 4);
                var unk1 = ReadU8(ofs + 8);
                var unk2 = ReadU16(ofs + 10);
                sb.AppendFormat("\tmusic_player gUnknown_{0:X8}, gUnknown_{1:X8}, {2}, {3}\n", playInfo, trackInfo, unk1, unk2);
                ofs += 12;
            }

            return sb.ToString();
        }

        static void DumpProgrammableWaveSample(int ofs, int len)
        {
            if (!offsets.Contains(ofs)) offsets.Add(ofs);
            if (soundInfo.ContainsKey(ofs)) return;

            var sb = new StringBuilder();
            var filename = String.Format("{0:X8}.pcm", ofs);
            var outfilename = String.Format("sound/programmable_wave_samples/{0}", filename);

            sb.Append("\t.align 2\n");
            sb.AppendFormat("\t.global ProgrammableWaveData_{0:X7}\n", ofs);
            sb.AppendFormat("ProgrammableWaveData_{0:X7}:\n", ofs);
            sb.AppendFormat("\t.incbin \"sound/programmable_wave_samples/{0}\"\n", filename);
            soundInfo.Add(ofs, sb.ToString());

            Directory.CreateDirectory("sound/programmable_wave_samples/");

            byte[] data = new byte[len];

            if (ofs > 0x20000C0)
                ofs -= 0x20000C0;

            Array.Copy(rom, ofs, data, 0, data.Length);

            File.WriteAllBytes(outfilename, data);
        }

        static void DumpDirectSoundSample(int ofs)
        {
            if (ofs == 0) return;
            if (!offsets.Contains(ofs)) offsets.Add(ofs);
            if (soundInfo.ContainsKey(ofs)) return;

            var sb = new StringBuilder();
            var filename = String.Format("{0:X8}.bin", ofs);
            var outfilename = String.Format("sound/direct_sound_samples/{0}", filename);

            sb.Append("\t.align 2\n");
            sb.AppendFormat("\t.global gUnknown_{0:X8}\n", ofs);
            sb.AppendFormat("gUnknown_{0:X8}:\n", ofs);
            sb.AppendFormat("\t.incbin \"sound/direct_sound_samples/{0}\"\n", filename);
            soundInfo.Add(ofs, sb.ToString());

            Directory.CreateDirectory("sound/direct_sound_samples/");

            var type = ReadU16(ofs + 0);
            var status = ReadU16(ofs + 2);
            var freq = ReadU32(ofs + 4);
            var loopStart = ReadU32(ofs + 8);
            var size = ReadU32(ofs + 12);
            byte[] data = new byte[size + 0x10 + 1];

            if (ofs > 0x20000C0)
                ofs -= 0x20000C0;
            Array.Copy(rom, ofs, data, 0, data.Length);

            File.WriteAllBytes(outfilename, data);
        }

        static string PrintVoiceGroup(int ofs, int len, int id)
        {
            if (!offsets.Contains(ofs)) offsets.Add(ofs);

            var sb = new StringBuilder();
            var filename = String.Format("voicegroup{0:d3}.inc", id);
            var outfilename = String.Format("sound/voicegroups/{0}", filename);

            sb.Append("\t.align 2\n");
            sb.AppendFormat("\t@********************** Voicegroup **********************@\n\n");
            sb.AppendFormat("\t.global voicegroup{0:d3}\n", id);
            sb.AppendFormat("voicegroup{0:d3}:\t@ 0x{1:X8}\n", id, ofs);

            int i = 0;
            while (i < len)
            {
                int tOfs = ofs + i;
                var type = ReadU8(ofs + i++);
                Debug.WriteLine("WTF 0x{0:X8} type=0x{1:X2}", tOfs, type);
                switch (type)
                {
                    case 0x00: //voice_directsound
                    case 0x08: //voice_directsound_no_resample
                    case 0x10: //voice_directsound_alt
                        {
                            //base_midi_key, pan, sample_data_pointer, attack, decay, sustain, release
                            var base_midi_key = ReadU8(ofs + i);
                            i += 2;
                            var pan = ReadU8(ofs + i) & 0x7F;
                            i++;
                            var sample_data_pointer = ReadU32(ofs + i);
                            i += 4;
                            var attack = ReadU8(ofs + i++);
                            var decay = ReadU8(ofs + i++);
                            var sustain = ReadU8(ofs + i++);
                            var release = ReadU8(ofs + i++);

                            DumpDirectSoundSample(sample_data_pointer);

                            switch (type)
                            {
                                case 0x00: //voice_directsound
                                    sb.AppendFormat("\tvoice_directsound {0}, {1}, gUnknown_{2:X8}, {3}, {4}, {5}, {6}\t@{7:X8}\n", base_midi_key, pan, sample_data_pointer, attack, decay, sustain, release, tOfs);
                                    break;
                                case 0x08: //voice_directsound_no_resample
                                    sb.AppendFormat("\tvoice_directsound_no_resample {0}, {1}, gUnknown_{2:X8}, {3}, {4}, {5}, {6}\t@{7:X8}\n", base_midi_key, pan, sample_data_pointer, attack, decay, sustain, release, tOfs);
                                    break;
                                case 0x10: //voice_directsound_alt
                                    sb.AppendFormat("\tvoice_directsound_alt {0}, {1}, gUnknown_{2:X8}, {3}, {4}, {5}, {6}\t@{7:X8}\n", base_midi_key, pan, sample_data_pointer, attack, decay, sustain, release, tOfs);
                                    break;
                            }
                        }
                        break;
                    case 0x01: //voice_square_1
                    case 0x09: //voice_square_1_alt
                        {
                            //sweep, duty_cycle, attack, decay, sustain, release
                            i++;
                            i++;
                            var sweep = ReadU8(ofs + i++);
                            var duty_cycle = ReadU8(ofs + i++);
                            i++;
                            i++;
                            i++;
                            var attack = ReadU8(ofs + i++);
                            var decay = ReadU8(ofs + i++);
                            var sustain = ReadU8(ofs + i++);
                            var release = ReadU8(ofs + i++);

                            switch (type)
                            {
                                case 0x01: //voice_square_1
                                    sb.AppendFormat("\tvoice_square_1 {0}, {1}, {2}, {3}, {4}, {5}\t@{6:X8}\n", sweep, duty_cycle, attack, decay, sustain, release, tOfs);
                                    break;
                                case 0x09: //voice_square_1_alt
                                    sb.AppendFormat("\tvoice_square_1_alt {0}, {1}, {2}, {3}, {4}, {5}\t@{6:X8}\n", sweep, duty_cycle, attack, decay, sustain, release, tOfs);
                                    break;
                            }
                        }
                        break;
                    case 0x02: //voice_square_2
                    case 0x0A: //voice_square_2_alt
                        {
                            // duty_cycle, attack, decay, sustain, release
                            i++;
                            i++;
                            i++;
                            var duty_cycle = ReadU8(ofs + i++);
                            i++;
                            i++;
                            i++;
                            var attack = ReadU8(ofs + i++);
                            var decay = ReadU8(ofs + i++);
                            var sustain = ReadU8(ofs + i++);
                            var release = ReadU8(ofs + i++);

                            switch (type)
                            {
                                case 0x02: //voice_square_2
                                    sb.AppendFormat("\tvoice_square_2 {0}, {1}, {2}, {3}, {4}\t@{5:X8}\n", duty_cycle, attack, decay, sustain, release, tOfs);
                                    break;
                                case 0x0A: //voice_square_2_alt
                                    sb.AppendFormat("\tvoice_square_2_alt {0}, {1}, {2}, {3}, {4}\t@{5:X8}\n", duty_cycle, attack, decay, sustain, release, tOfs);
                                    break;
                            }
                        }
                        break;
                    case 0x03: //voice_programmable_wave
                    case 0x0B: //voice_programmable_wave_alt
                        {
                            //wave_samples_pointer, attack, decay, sustain, release
                            i++;
                            i++;
                            i++;
                            var wave_samples_pointer = ReadU32(ofs + i);
                            i += 4;
                            var attack = ReadU8(ofs + i++);
                            var decay = ReadU8(ofs + i++);
                            var sustain = ReadU8(ofs + i++);
                            var release = ReadU8(ofs + i++);

                            DumpProgrammableWaveSample(wave_samples_pointer, 16);

                            switch (type)
                            {
                                case 0x03: //voice_square_2
                                    sb.AppendFormat("\tvoice_programmable_wave ProgrammableWaveData_{0:X7}, {1}, {2}, {3}, {4}\t@{5:X8}\n", wave_samples_pointer, attack, decay, sustain, release, tOfs);
                                    break;
                                case 0x0B: //voice_square_2_alt
                                    sb.AppendFormat("\tvoice_programmable_wave_alt ProgrammableWaveData_{0:X7}, {1}, {2}, {3}, {4}\t@{5:X8}\n", wave_samples_pointer, attack, decay, sustain, release, tOfs);
                                    break;
                            }
                        }
                        break;
                    case 0x04: //voice_noise
                    case 0x0C: //voice_noise_alt
                        {
                            // duty_cycle, attack, decay, sustain, release
                            var unk1 = ReadU8(ofs + i++);
                            var unk2 = ReadU8(ofs + i++);
                            var unk3 = ReadU8(ofs + i++);
                            var period = ReadU8(ofs + i++);
                            i++;
                            i++;
                            i++;
                            var attack = ReadU8(ofs + i++);
                            var decay = ReadU8(ofs + i++);
                            var sustain = ReadU8(ofs + i++);
                            var release = ReadU8(ofs + i++);

                            switch (type)
                            {
                                case 0x04: //voice_noise
                                    sb.AppendFormat("\tvoice_noise {0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}\t@{8:X8}\n", unk1, unk2, unk3, period, attack, decay, sustain, release, tOfs);
                                    break;
                                case 0x0C: //voice_noise_alt
                                    sb.AppendFormat("\tvoice_noise_alt {0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}\t@{8:X8}\n", unk1, unk2, unk3, period, attack, decay, sustain, release, tOfs);
                                    break;
                            }
                        }
                        break;
                    case 0x40: //voice_keysplit
                        {
                            //voice_group_pointer, keysplit_table_pointer
                            i++;
                            i++;
                            i++;
                            var voice_group_pointer = ReadU32(ofs + i);
                            i += 4;
                            var keysplit_table_pointer = ReadU32(ofs + i);
                            i += 4;

                            if (!offsets.Contains(voice_group_pointer)) offsets.Add(voice_group_pointer);
                            if (!offsets.Contains(keysplit_table_pointer)) offsets.Add(keysplit_table_pointer);

                            if (!voicegroups.Contains(voice_group_pointer))
                                voicegroups.Add(voice_group_pointer);
                            if (!keysplits.Contains(keysplit_table_pointer))
                                keysplits.Add(keysplit_table_pointer);

                            sb.AppendFormat("\tvoice_keysplit voicegroup{0:d3}, KeySplitTable{1:d3}\t@{2:X8}\n", voicegroups.IndexOf(voice_group_pointer), keysplits.IndexOf(keysplit_table_pointer), tOfs);
                        }
                        break;
                    case 0x80: //voice_keysplit_all
                        {
                            //voice_group_pointer
                            i++;
                            i++;
                            i++;
                            var voice_group_pointer = ReadU32(ofs + i);
                            i += 4;
                            i += 4;

                            if (!offsets.Contains(voice_group_pointer)) offsets.Add(voice_group_pointer);

                            if (!voicegroups.Contains(voice_group_pointer))
                                voicegroups.Add(voice_group_pointer);

                            sb.AppendFormat("\tvoice_keysplit_all voicegroup{0:d3}\t@{1:X8}\n", voicegroups.IndexOf(voice_group_pointer), tOfs);
                        }
                        break;
                    default:
                        throw new Exception("FUCK!");
                        break;
                }
            }


            Directory.CreateDirectory("sound/voicegroups/");
            File.WriteAllText(outfilename, sb.ToString());

            return sb.ToString();
        }

        static string PrintSongTrack(int idx, int ofs, int len, int song_ofs, string name)
        {
            if (!offsets.Contains(ofs)) offsets.Add(ofs);
            var sb = new StringBuilder();

            sb.AppendFormat("\n\t@********************** Track  {0} **********************@\n\n", idx);
            if (idx == 1 || SongsWithTrackAlignment.ContainsKey(name))
            {
                sb.Append("\t.align 2\n");
            }
            sb.AppendFormat("\t.global {0}_{1}\n", name, idx);
            sb.AppendFormat("{0}_{1}:\t@ 0x{2:X8}\n", name, idx, ofs);

            var localLabels = new Dictionary<int, string>();

            var localLabelId = 0;

            for (int i = 0; i < len; i++)
            {
                //TODO: Make this print nicer?
                var cmd = ReadU8(ofs + i);
                switch (cmd)
                {
                    case 0xB2: //GOTO
                    case 0xB3: //PATT
                    case 0xB5: //REPT
                        {
                            if (cmd == 0xB5)
                            {
                                i++;
                            }
                            var adr = ReadU32(ofs + i + 1);
                            if (!localLabels.ContainsKey(adr))
                            {
                                localLabelId++;
                                localLabels.Add(adr, string.Format("{0}_{1}_{2}", name, idx, localLabelId));
                            }
                            i += 4;
                            break;
                        }
                    default:
                        break;
                }
            }

            byte prev = 0;
            var fine = false;
            for (int i = 0; i < len && !fine; i++)
            {
                var cmd = ReadU8(ofs + i);

                if (localLabels.ContainsKey(ofs + i))
                    sb.AppendFormat("{0}:\n", localLabels[ofs + i]);

                sb.Append("\t.byte\t");

                var cmdName = "";
                if (cmd >= 0x80)
                {
                    cmdName = MML[cmd];
                }
                if (cmd < 0x80 && prev > 0)
                {
                    cmd = prev;
                    i--;
                }

                switch (cmd)
                {
                    case 0xCE: // EOT
                    case 0xCF: // TIE
                    case 0xD0: // N01
                    case 0xD1:
                    case 0xD2:
                    case 0xD3:
                    case 0xD4:
                    case 0xD5:
                    case 0xD6:
                    case 0xD7:
                    case 0xD8:
                    case 0xD9:
                    case 0xDA:
                    case 0xDB:
                    case 0xDC:
                    case 0xDD:
                    case 0xDE:
                    case 0xDF:
                    case 0xE0:
                    case 0xE1:
                    case 0xE2:
                    case 0xE3:
                    case 0xE4:
                    case 0xE5:
                    case 0xE6:
                    case 0xE7:
                    case 0xE8:
                    case 0xE9:
                    case 0xEA:
                    case 0xEB:
                    case 0xEC:
                    case 0xED:
                    case 0xEE:
                    case 0xEF:
                    case 0xF0:
                    case 0xF1:
                    case 0xF2:
                    case 0xF3:
                    case 0xF4:
                    case 0xF5:
                    case 0xF6:
                    case 0xF7:
                    case 0xF8:
                    case 0xF9:
                    case 0xFA:
                    case 0xFB:
                    case 0xFC:
                    case 0xFD:
                    case 0xFE:
                    case 0xFF: // N96
                        {
                            sb.AppendFormat("\t{0}\t", cmdName);
                            var key = ReadU8(ofs + i + 1);
                            if (key < 0x80)
                            {
                                if (cmdName.Length > 0)
                                {
                                    sb.Append(", ");
                                }
                                sb.Append(Keys[key]);
                                i++;
                            }
                            var velo = ReadU8(ofs + i + 1);
                            if (cmd > 0xCE && velo < 0x80)
                            {
                                sb.AppendFormat(", v{0:d3}", velo);
                                i++;
                            }
                            var gtp = ReadU8(ofs + i + 1);
                            if (cmd > 0xCF && gtp < 0x80)
                            {
                                sb.AppendFormat(", {0}", gtp);
                                i++;
                            }
                            prev = cmd;
                            break;
                        }
                    case 0xB9: // MEMACC (unused in Fire Emblem 8)
                        {
                            var mem_set = ReadU8(ofs + i + 1);
                            var adr = ReadU8(ofs + i + 2);
                            var dat = ReadU8(ofs + i + 3);
                            sb.AppendFormat("MEMACC\t, {0}\t, 0x{1:X2}, {2}", MemSet[mem_set], adr, dat);
                            i += 3;
                            if (mem_set > 5)
                            {
                                var dest = ReadU8(ofs + i + 1);
                                sb.AppendFormat("\n\t\t.word\t0x{0:X8}", dest);
                                i += 4;
                            }
                            break;
                        }
                    case 0xCD: // XCMD
                        {
                            sb.AppendFormat("\t{0}\t", cmdName);
                            var xIECX = ReadU8(ofs + i + 1);
                            if (cmdName.Length > 0)
                            {
                                sb.Append(", ");
                            }
                            sb.Append(MML[xIECX]);
                            i++;
                            prev = cmd;
                            break;
                        }
                    case 0xB2: //GOTO
                    case 0xB3: //PATT
                    case 0xB5: //REPT
                        {
                            sb.AppendFormat("{0}\t", cmdName);
                            if (cmd == 0xB5)
                            {
                                var count = ReadU8(ofs + i + 1);
                                sb.AppendFormat(", {0}", count);
                                i++;
                            }
                            var adr = ReadU32(ofs + i + 1);
                            sb.AppendFormat("\n\t\t.word\t{0}", localLabels[adr]);
                            i += 4;
                            break;
                        }
                    case 0x80: // W00
                    case 0x81:
                    case 0x82:
                    case 0x83:
                    case 0x84:
                    case 0x85:
                    case 0x86:
                    case 0x87:
                    case 0x88:
                    case 0x89:
                    case 0x8A:
                    case 0x8B:
                    case 0x8C:
                    case 0x8D:
                    case 0x8E:
                    case 0x8F:
                    case 0x90:
                    case 0x91:
                    case 0x92:
                    case 0x93:
                    case 0x94:
                    case 0x95:
                    case 0x96:
                    case 0x97:
                    case 0x98:
                    case 0x99:
                    case 0x9A:
                    case 0x9B:
                    case 0x9C:
                    case 0x9D:
                    case 0x9E:
                    case 0x9F:
                    case 0xA0:
                    case 0xA1:
                    case 0xA2:
                    case 0xA3:
                    case 0xA4:
                    case 0xA5:
                    case 0xA6:
                    case 0xA7:
                    case 0xA8:
                    case 0xA9:
                    case 0xAA:
                    case 0xAB:
                    case 0xAC:
                    case 0xAD:
                    case 0xAE:
                    case 0xAF:
                    case 0xB0: // W96
                    case 0xB1: // FINE
                    case 0xB4: // PEND
                        {
                            sb.Append(cmdName);
                            if (cmd == 0xB1)
                            {
                                fine = true;
                            }
                            break;
                        }
                    case 0xBA: // PRIO
                    case 0xBB: // TEMPO
                    case 0xBC: // KEYSH
                    case 0xC2: // LFOS
                    case 0xC3: // LFODL
                    case 0xC5: // MODT
                        {
                            sb.AppendFormat("{0}\t", cmdName);
                            var arg = ReadU8(ofs + i + 1);
                            if (cmdName.Length > 0)
                            {
                                sb.Append(", ");
                            }
                            sb.AppendFormat("{0}", arg);
                            i++;
                            break;
                        }
                    case 0xBD: // VOICE
                    case 0xBE: // VOL
                    case 0xBF: // PAN
                    case 0xC0: // BEND
                    case 0xC1: // BENDR
                    case 0xC4: // MOD
                    case 0xC8: // TUNE
                        {
                            var arg = ReadU8(ofs + i + 1);
                            var argStr = String.Format("{0}", arg);
                            if (cmd == 0xBF || cmd == 0xC0 || cmd == 0xC8)
                            {
                                argStr = "c_v";
                                if (arg > 64)
                                {
                                    argStr = String.Format("{0}+{1}", argStr, arg - 64);
                                }
                                if (arg < 64)
                                {
                                    argStr = String.Format("{0}-{1}", argStr, 64 - arg);
                                }
                            }
                            if (cmd == 0xBE)
                            {
                                argStr = String.Format("v{0:d3}", arg);
                            }
                            sb.AppendFormat("{0}\t", cmdName);
                            if (cmdName.Length > 0)
                            {
                                sb.Append(", ");
                            }
                            sb.Append(argStr);
                            i++;
                            prev = cmd;
                            break;
                        }
                    default:
                        {
                            //sb.AppendFormat("0x{0:X2}", cmd);
                            //break;
                            throw new Exception("Invalid cmd!");
                        }
                }

                sb.Append("\n");
            }

            return sb.ToString();
        }

        static string PrintSong(int ofs, int id)
        {
            if (!offsets.Contains(ofs)) offsets.Add(ofs);
            var sb = new StringBuilder();
            var sbt = new StringBuilder();
            var currName = String.Format("song{0:d3}", id);
            var realName = currName;
            if (soundInfo.ContainsKey(ofs))
            {
                int pos = soundInfo[ofs].IndexOf(".global song");
                realName = soundInfo[ofs].Substring(pos + 8, 7);
            }
            var filename = String.Format("{0}.s", realName);
            var outfilename = String.Format("sound/songs/{0}", filename);

            sbt.Append("\t.include \"MPlayDef.s\"\n\n");
            sbt.Append("\t.section .rodata\n");

            sb.Append("\n\t.align 2\n");
            sb.AppendFormat("\t.global {0}\n", realName);
            sb.AppendFormat("{0}:\t@ 0x{1:X8}\n", realName, ofs);

            var trackCount = ReadU8(ofs + 0);
            var blockCount = ReadU8(ofs + 1);
            var priority = ReadU8(ofs + 2);
            var reverb = ReadU8(ofs + 3);
            var tone = ReadU32(ofs + 4);

            sb.AppendFormat("\t.byte\t{0}\t\t@ trackCount\n", trackCount);
            sb.AppendFormat("\t.byte\t{0}\t\t@ blockCount\n", blockCount);
            sb.AppendFormat("\t.byte\t{0}\t\t@ priority\n", priority);
            sb.AppendFormat("\t.byte\t{0}\t\t@ reverb\n\n", reverb);
            if (id > 0)
            {
                if (!soundInfo.ContainsKey(tone) || !soundInfo[tone].Contains(".global voicegroup"))
                {
                    sb.AppendFormat("\t.word\tgUnknown_{0:X8}\t\t@ voicegroup/tone\n\n", tone);
                }
                else
                {
                    int pos = soundInfo[tone].IndexOf(".global voicegroup");
                    sb.AppendFormat("\t.word\t{0}\t\t@ voicegroup/tone\n\n", soundInfo[tone].Substring(pos + 8, 13));
                }
            }

            /*if (!soundInfo.ContainsKey(tone))
                soundInfo.Add(tone, PrintVoiceGroup(tone, VoiceGroupLen));*/
            if (trackCount > 0 && !voicegroups.Contains(tone))
                voicegroups.Add(tone);

            for (int i = 0; i < trackCount; i++)
            {
                var part = ReadU32(ofs + 8 + (4 * i));
                int nextpart;

                if (i + 1 >= trackCount)
                {
                    //TODO: Is this a safe assumption?
                    nextpart = ofs;
                }
                else
                {
                    nextpart = ReadU32(ofs + 8 + (4 * (i + 1)));
                }

                sb.AppendFormat("\t.word\t{0}_{1}\t\t@ track\n", realName, i + 1);

                var st = PrintSongTrack(i + 1, part, nextpart - part, ofs, realName);
                sbt.Append(st);
                if (!soundInfo.ContainsKey(part))
                    soundInfo.Add(part, st);
            }

            if (String.Compare(realName, currName) == 0)
            {
                // int[] goodSongs = {
                //     114, 228, 244, 273, 282,
                //     286, 296, 222, 231, 259,
                //     280, 283, 288, 224, 237,
                //     270, 281, 285, 290
                // };
                int[] goodSongs = {
                   23
                };

                if (goodSongs.Contains(id) || true)
                {
                    Directory.CreateDirectory("sound/songs/");
                    File.WriteAllText(outfilename, sbt.ToString() + sb.ToString());
                }
            }

            return sbt.ToString() + sb.ToString();
        }

        static string PrintSongTable(int ofs)
        {
            if (!offsets.Contains(ofs)) offsets.Add(ofs);
            var sb = new StringBuilder();

            sb.Append("\t.align 2\n");
            sb.AppendFormat("\t.global gSongTable\n");
            sb.AppendFormat("gSongTable:\t@ 0x{0:X8}\n", ofs);
            for (int i = 0; i < NumSongs; i++)
            {
                var header = ReadU32(ofs + 0);
                var ms = ReadU16(ofs + 4);
                var me = ReadU16(ofs + 6);

                //todo rip song
                if (!soundInfo.ContainsKey(header))
                    soundInfo.Add(header, PrintSong(header, i));
                else
                    soundInfo[header] = PrintSong(header, i);

                int pos = soundInfo[header].IndexOf(".global song");
                sb.AppendFormat("\tsong {0}, {1}, {2}\n", soundInfo[header].Substring(pos + 8, 7), ms, me);

                ofs += 8;
            }

            return sb.ToString();
        }

        static string PrintKeySplit(int ofs, int len)
        {
            if (!offsets.Contains(ofs)) offsets.Add(ofs);
            var sb = new StringBuilder();

            sb.Append("\t.align 2\n");
            sb.AppendFormat("\t@********************** KeySplit **********************@\n\n");
            sb.AppendFormat("\t.global KeySplitTable{0:d3}\n", keysplits.IndexOf(ofs));
            sb.AppendFormat("KeySplitTable{0:d3}:\t@ 0x{0:X8}\n", keysplits.IndexOf(ofs), ofs);

            int i = 0;
            while (i < len)
            {
                var val = ReadU8(ofs + i++);
                sb.AppendFormat("\t.byte\t{0}\n", val);
            }

            return sb.ToString();
        }

        static void Main(string[] args)
        {
            rom = File.ReadAllBytes("data/rom_data.bin");

            soundInfo.Add(MPlayTableAdr, PrintMPlayTable(MPlayTableAdr));
            PrintSongTable(SongTableAdr);

            voicegroups.Add(VoiceGroupEndAdr);
            voicegroups.Sort();
            for (int i = 0; i < voicegroups.Count - 1; i++)
            {
                int start = voicegroups[i];
                int end = voicegroups[i + 1];
                PrintVoiceGroup(start, end - start, i);
            }

            voicegroups.Sort();
            for (int i = 0; i < voicegroups.Count - 1; i++)
            {
                int start = voicegroups[i];
                int end = voicegroups[i + 1];
                soundInfo.Add(start, PrintVoiceGroup(start, end - start, i));
            }

            //Sort all offsets
            keysplits.Sort();
            offsets.Sort();
            // var lastKetSplitAdr = keysplits[keysplits.Count - 1];
            // var keySplitEndAdr = 0;
            // for (int i = 0; i < offsets.Count; i++)
            // {
            //     if ((offsets[i] > lastKetSplitAdr))
            //     {
            //         keySplitEndAdr = offsets[i];
            //         break;
            //     }

            // }

            // keysplits.Add(keySplitEndAdr);
            keysplits.Add(KeySplitEndAdr);
            keysplits.Sort();
            for (int i = 0; i < keysplits.Count - 1; i++)
            {
                int start = keysplits[i];
                int end = keysplits[i + 1];
                soundInfo.Add(start, PrintKeySplit(start, end - start));
            }

            soundInfo.Add(SongTableAdr, PrintSongTable(SongTableAdr));

            var sb = new StringBuilder();
            string prev = "songxxx";
            foreach (var adr in soundInfo)
            {
                if (adr.Value.Contains(".global voicegroup"))
                {
                    int pos = adr.Value.IndexOf(".global voicegroup");
                    sb.AppendFormat(".include \"sound/voicegroups/{0}.inc\"\n", adr.Value.Substring(pos + 8, 13));
                    continue;
                }

                if (adr.Value.Contains(".global song"))
                {
                    int pos = adr.Value.IndexOf(".global song");
                    string curr = adr.Value.Substring(pos + 8, 7);
                    if (String.Compare(curr, prev) != 0)
                    {
                        sb.AppendFormat(".include \"sound/songs/{0}.inc\"\n", curr);
                        prev = curr;
                    }
                    continue;
                }
                sb.Append(adr.Value);
                sb.Append("\n");
            }

            File.WriteAllText("sound.s", sb.ToString());
        }
    }
}
