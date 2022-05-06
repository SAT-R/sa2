import py_midicsv as pm
import sys

matched_signatures = {
    "song0405": "5/4",
    "song0406": "13/4"
}


data = pm.midi_to_csv(f'sound/songs/midi/{sys.argv[1]}.mid')

for i in range(len(data)):
    line = data[i]

    if 'Time_signature' in line:
        print(line)
        new_data = line.split(', ')
        
        # Set the time signature
        new_data[3] = sys.argv[2]
        new_data[4] = str(int(sys.argv[3]) // 2)

        data[i] = ", ".join(new_data)

midi_object = pm.csv_to_midi(data)

with open(f'sound/songs/midi/{sys.argv[1]}.mid', "wb") as output_file:
    midi_writer = pm.FileWriter(output_file)
    midi_writer.write(midi_object)
