# Integrating multi-omics and prior biological data to predict Colorectal cancer cells using Single Cell Trio-seq data


Cancer is a disease, caused by unregulated cell growth, can spread in any region of the body and sometimes this region can be undetected. Several studies have predicted cancer cells from Single Cell RNA-seq (scRNA-seq) data; however, using only gene expression or DNA methylation data individually and without biological relevance. Here we have built deep learning models integrating gene expression and DNA methylation data and biological information such as Protein-Protein Interaction (PPI) and Protein-DNA Interaction (PDI) and KEGG pathway to predict colorectal cancer cells from tumors and their metastases precisely. We have found 91% accuracy by merging gene expression data and DNA methylation data. We have shown that using multi omics data performs better than using only one data modality.

__Model Building and Architectures__

In this study, we adopted five different deep neural network architectures. The models are listed below. Each of the models are described in the next sections. 

                        1. Gene Expression Neural Network (GENN)
                        2. DNA Methylation Neural Network  (DMNN)
                        3. Gene Expression and DNA Methylation Neural Network (GE+DMNN)
                        4. Gene Expression + PDI Neural Network (GE+PDINN)
                        5. Gene Expression + PPI Neural Network (GE+PPINN)

__Model Architecture Figures__

1.GENN & DMNN Models individual 

![GENN   DMNN](https://user-images.githubusercontent.com/63742110/215380751-39989dbe-f425-4c23-bd17-8c6ab09392a5.jpeg)

2.GENN + DMNN Model

![GENN + DMNN](https://user-images.githubusercontent.com/63742110/215380862-e32cda2d-25f7-4c42-9145-6e00fe918ba3.jpeg)

3.GE + PDINN

![GE+PDINN](https://user-images.githubusercontent.com/63742110/215380921-ca58cd53-47b8-4aa5-8416-e1076af05484.png)
