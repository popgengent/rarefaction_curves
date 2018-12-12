setwd('') #add current working directory
require(ggplot2)
require(data.table)
require("cowplot")

pops = c('Gha','Han','IND','Khom','MFA','Nama','PFA','Yuc','papuan')
for (pop in pops) {
hlab = fread(paste0('rarified/',pop,'_HLA-B.txt'))
hlab$gene = 'HLA-B'
kir = fread(paste0('rarified/',pop,'_3DL3.txt'))
kir$gene = 'KIR3DL3'

combined = rbind(kir,hlab)
myplot <- ggplot(data=rbind(kir,hlab),aes(x=N,y=MEAN,colour=gene)) + 
  geom_line(lwd=1) + geom_ribbon(aes(ymin=L95,ymax=U95),alpha=0.3 ) +
  labs(x='Total Alleles',y='Unique Alleles')
#ggsave(paste0(pop,'_HLAB_vs_3DL3.pdf'),height=3,width=5)
save_plot(paste0(pop,'_HLAB_vs_3DL3.pdf'), myplot, base_aspect_ratio = 1.3)
}


for (pop in pops) {
  hlab = fread(paste0('rarified/',pop,'_HLA-B.txt'))
  hlab$gene = 'HLA-B'
  kir = fread(paste0('rarified/',pop,'_3DL3.txt'))
  kir$gene = 'KIR3DL3'
  myplot <- ggplot(data=rbind(kir,hlab),aes(x=N,y=MEAN,colour=gene)) + 
    geom_line(lwd=0.5, lty=3, aes(x=N, y=L95, colour=gene)) +
    geom_line(lwd=0.5, lty=3, aes(x=N, y=U95, colour=gene)) +
    geom_line(lwd=2)  +
    scale_color_manual(values=c("cyan4", "brown2")) +
    labs(x='Total Alleles',y='Unique Alleles')
  #print(myplot) #,
  save_plot(paste0(pop,'_HLAB_vs_3DL3_no_fill.pdf'), myplot, base_aspect_ratio = 1.3)
}
