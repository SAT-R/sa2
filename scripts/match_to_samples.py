import hashlib
import os
import codecs

# Can be used to match direct sound samples to sample
# files (so we can name). Atm can't find any samples which match
# using checksums

def file_as_bytes(file):
    with file:
        return file.read()

f_list = sorted(filter(lambda f: f.endswith('.aif') , os.listdir("direct_sound_samples")))
f_list_samples = sorted(filter(lambda f: f.endswith('.aif') , os.listdir("samples")))

checksums = dict([(fname, str(codecs.encode(hashlib.md5(file_as_bytes(open("direct_sound_samples/" + fname, 'rb'))).digest(), 'hex'))) for fname in f_list])
checksum_samples = dict([(str(codecs.encode(hashlib.md5(file_as_bytes(open("samples/" + fname, 'rb'))).digest(), 'hex')), fname) for fname in f_list_samples])

for orig_sample in checksums:
    if checksums[orig_sample] in checksum_samples:
        print(orig_sample, checksum_samples[checksums[orig_sample]])
