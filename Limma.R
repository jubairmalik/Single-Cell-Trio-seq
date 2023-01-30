library(edgeR)
counts <- log(impute.exp+1)
counts <- t(counts)
d0 <- DGEList(counts,remove.zeros = T)
d0 <- calcNormFactors(d0)
pt<-rep(0,nrow(impute.exp))
ln<-rep(0,nrow(impute.exp))
nc<-rep(0,nrow(impute.exp))
mp<-rep(0,nrow(impute.exp))
ccl<-rep(0,nrow(impute.exp))
ml<-rep(0,nrow(impute.exp))

for (i in (1:nrow(impute.exp))){
  if(true.labels$true.labels[i]==1){
    pt[i]=1
  }
  if(true.labels$true.labels[i]==2){
    ln[i]=2
  }
  if(true.labels$true.labels[i]==3){
    nc[i]=3
  }
  if(true.labels$true.labels[i]==4){
    mp[i]=4
  }
  if(true.labels$true.labels[i]==5){
    ccl[i]=5
  }
  if(true.labels$true.labels[i]==0){
    ml[i]=6
  }
}

design<-cbind(pt,ln,nc,mp,ccl,ml)

#design2<-cbind(ln,nc,mp,ccl,ml)


# f <- factor(true.labels$true.labels, levels=c("pt","ln","nc","mp","ccl","ml"))
# design2 <- model.matrix(~0+f,data = true.labels$true.labels)
# colnames(design2) <- c("pt","ln","nc","mp","ccl","ml")

fit.all <- lmFit(counts, design)
contrast.matrix <- makeContrasts(pt-ln, pt-nc, pt-mp,pt-ccl,pt-ml,
                                 ln-nc,ln-mp,ln-ccl,ln-ml,
                                 nc-mp,nc-ccl,nc-ml,
                                 mp-ccl,mp-ml,
                                 ccl-ml,levels=c("pt","ln","nc","mp","ccl","ml"))
fit2.all <- contrasts.fit(fit.all, contrast.matrix)
fit2.all <- eBayes(fit2.all)

results<-decideTests(fit2.all)
vennDiagram(results)
top.table <- topTable(fit2.all, sort.by = "none", number = Inf, adjust.method = "BH")
head(top.table, 20)