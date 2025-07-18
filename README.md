# EEG-Based Emotion Analysis Using the DREAMER Dataset

This repository contains all the analysis scripts, visualizations, and documentation for our project exploring the relationships between EEG power bands (Alpha, Beta, Theta) and emotion dimensions (Valence, Arousal, Dominance - VAD). The analysis is based on the DREAMER dataset and uses statistical correlation, topographic mapping, and custom EEG plotting.

The core objective of this project is to examine whether patterns in EEG activity can reliably predict emotional states, with a particular focus on anxiety detection. We investigate the following five research questions:

1. Is high beta power associated with high arousal?
2. Do high alpha values correspond to low arousal and high valence?  
3. Are high theta values linked to low dominance?
4. Do fear-related videos elicit EEG patterns consistent with anxiety?
5. Are there gender differences in EEG-VAD relationships or self-reporting?

We used the **DREAMER dataset** for EEG and self-reported VAD values and **Emotiv EPOC+** electrode positioning (14 channels).

# Dataset

- **Source**: S. Katsigiannis and N. Ramzan, **"DREAMER: A Database for Emotion Recognition Through EEG and ECG Signals From Wireless Low-cost Off-the-Shelf Devices,"** in IEEE Journal of Biomedical and Health Informatics, vol. 22, no. 1, pp. 98-107, Jan. 2018, doi: 10.1109/JBHI.2017.2688239. (https://ieeexplore.ieee.org/document/7887697), [DREAMER Dataset](https://www.kaggle.com/datasets/birdy654/eeg-brainwave-dataset-feeling-emotions)
- **Format**: Pre-extracted EEG power values for Alpha, Beta, and Theta bands (from 14 electrodes), and associated VAD scores (1–5 scale).
- **Preprocessing**: Signal filtering and PSD feature extraction were performed before loading into `ml_data.csv`.

# Methodology:

- **Statistical Correlation**:  
  For each band (alpha, beta, theta), we computed **Pearson correlation coefficients** between the EEG power at each electrode and the emotional dimensions (valence, arousal, dominance).

- **Topographic Mapping**:
  Built-in topographic plotting via eegUtils::topoplot(), which offers biologically accurate and aesthetically clear EEG scalp visualizations with minimal setup. These were used for polished, high-resolution publication-ready figures.

- **Exploratory Plots**:  
  Scatter plots were created per electrode to show individual-level correlations and regression lines with `p` and `r` values displayed.

# Requirements:
This project was built using RStudio, **R 4.3+**. Required packages:

install.packages(c("tidyverse", "ggplot2", "patchwork", "akima", "viridis", "eegUtils"))

# Installation : 
  **1. Clone the repository :**
    git clone https://github.com/crnabnz/DataSci-in-R---EEG-Based-Record-linked-to-Self-Reported-Emotional-Distress.git
    cd DataSci-in-R---EEG-Based-Record-linked-to-Self-Reported-Emotional-Distress
  **2.1 Python Environment Setup :**
    - **Option "Conda" (Recommended):** (I am not sure about this step)
      conda env create -f environment.yml
      conda activate eeg-env
    - **Option pip:**
      python -m venv venv
      source venv/bin/activate
      pip install -r requirements.txt
  **2.2 R Environment Setup :**
    Recommended  R packages: You can install R packages listed below in RStudio or your terminal:
    install.packages(c(
        "tidyverse",
        "readr",
        "ggplot2",
        "reshape2",
        "RColorBrewer",
        "eegUtils",
        "rmarkdown"
    ))
  **3. Prepare Data :**
    Due to licensing, the DREAMER dataset is not included in this repository.
      1. Download the DREAMER dataset from Kaggle.
      2. Unzip and place the files in the data/ directory.
  **4. Run :**
       Once the environments are ready and the dataset it in place:
       

# References : 
Craddock, M. (2021). eegUtils: A utility package for manipulating and plotting EEG data in R. (https://github.com/craddm/eegUtils)
