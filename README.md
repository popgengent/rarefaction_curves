# Rarefaction Curves

Scripts to create rarefaction curves (plot of the number of alleles as a function of the number of samples). 

Input for rarify_alleles.py must be a .txt file with a header. The header row contains the names of loci with the first entry being blank. Subsequent rows contain a sample name followed by an allele name that corresponds to the column indicated in the header row. Sample names are formatted as population_id such that the rarify_alleles.py can distinguish between samples from different populations. 

The R script is used for plotting, and will need to be customized according to the populations used in the input file. This script may be more useful as a template rather than a standalone solution to plotting the curves.
