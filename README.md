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
  Using interpolation (`akima::interp`) and custom plotting in `ggplot2`, we visualized correlation values on EEG topomaps, adding anatomical features (ears & nose) manually.

- **Exploratory Plots**:  
  Scatter plots were created per electrode to show individual-level correlations and regression lines with `p` and `r` values displayed.

# Requirements:
This project was built using RStudio, **R 4.3+**. Required packages:

install.packages(c("tidyverse", "ggplot2", "patchwork", "akima", "viridis"))
