text = input()

for word in ['c=', 'c-', 'dz=', 'd-', 'lj', 'nj', 's=', 'z=']:
    text = text.replace(word, '*')

print(len(text))
