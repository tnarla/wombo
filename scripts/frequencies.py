import os
import csv

import json
import pprint

base = os.path.dirname(__file__)
data = os.path.join(base, '..', 'data')

ngram_path = os.path.join(data, 'ngrams1.csv')

frequencies = {}
with open(ngram_path) as ngrams:
    reader = csv.DictReader(ngrams)
    for row in reader:
        letter = row['1-gram']
        count = row['*/*']
        frequencies[letter] = 1. * int(count)

assert len(frequencies) == 26

total = sum(frequencies.values())

probabilities = {char: freq / (1. * total) for char, freq in frequencies.items()}
pprint.pprint(probabilities)

output_path = os.path.join(data, 'frequencies.json')
with open(output_path, 'w+') as output:
    json.dump(probabilities, output)
