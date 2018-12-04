csdtmodel <- readRDS("csdtformodel.RDS")
names(csdtmodel)
csdmat <- as.matrix(csdtmodel[,5:7])


## som clustering
library(kohonen)
som.grid <- somgrid(xdim=1, ydim=3, topo="hexagonal", toroidal=T)
set.seed(123)
som.model.forcsdt <- som(csdmat, grid=som.grid, keep.data=T, rlen=100)


library(dplyr)
som.output %>% group_by(clusterno) %>% summarise(mon_avg = mean(monetary), rec_avg = mean(recency),freq_avg = mean(frezq),cnt = n())
