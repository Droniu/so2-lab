linux = set(line.strip() for line in open('linuxlist.txt'))
apple = set(line.strip() for line in open('maclist.txt'))
print('\n'.join(linux - apple))