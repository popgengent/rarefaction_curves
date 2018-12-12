from sys import argv
from random import shuffle,seed
from numpy import *

pop,gene = argv[-2:]

infile = 'KIR3DL3vsHLAandotherKIR_Allpops_perInd.txt'

alleles = []

for i, line in enumerate(file(infile)):
	line = line.strip().split()
	if i == 0:
		genes = line
		genecol = genes.index(gene) + 1
	else:
		linepop = line[0].split('_')[0]
		if linepop == pop:
			print line
			alleles.append(line[genecol])
			
outfile = file('rarified/%s_%s.txt' % (pop,gene) , 'w')

# go through each and rarify each
outfile.write('N\tMEAN\tL95\tU95\n')
n = len(alleles)
while n > 0:
	print 'on %s' % (n)
	#200 samples
	counts = []
	for sample in range(200):
		seed(sample)
		shuffle(alleles)
		curralleles = alleles[:n]
		nalleles = len(set(curralleles))
		counts.append(nalleles)
	counts.sort()
	outfile.write('%s\t%s\t%s\t%s\n' % (n,mean(counts),counts[4],counts[195]))
	n-=1



outfile.close()