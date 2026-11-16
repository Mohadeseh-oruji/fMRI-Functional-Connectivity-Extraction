# fMRI-Functional-Connectivity-Extraction
MATLAB-based extraction and organization of ROI-to-ROI functional connectivity data across experimental conditions using CONN
# fMRI Functional Connectivity Extraction

### MATLAB-based ROI-to-ROI Functional Connectivity Analysis Using CONN

## Overview

This project provides a MATLAB script for extracting and organizing region-to-region (ROI-to-ROI) functional connectivity (FC) values from first-level results generated using the CONN toolbox.

The script processes three experimental conditions and extracts unique pairwise connectivity values across all participants.

## Analysis Workflow

The script performs the following steps:

1. Loads ROI-to-ROI connectivity results for three experimental conditions.
2. Identifies and extracts unique ROI pairs while excluding diagonal elements.
3. Organizes connectivity values across participants and conditions.
4. Checks ROI consistency and the number of participants across conditions.
5. Checks for missing (NaN) and infinite (Inf) values.
6. Exports the resulting dataset into an Excel file.

## Dataset Structure

The current analysis includes:

- **Participants:** 39
- **Experimental conditions:** 3
- **ROIs:** 5
- **Unique ROI-to-ROI connections:** 10
- **Total observations:** 117 (39 participants × 3 conditions)

The output is organized in long format, with each row representing one participant under one experimental condition.

## Tools and Technologies

- MATLAB
- CONN Toolbox
- ROI-to-ROI Functional Connectivity Analysis
- Excel

## Repository Structure

```text
fMRI-Functional-Connectivity-Extraction/
│
├── README.md
└── extract_fc_all_conditions.m
```

## Usage

1. Ensure that MATLAB and the CONN toolbox are available.
2. Generate first-level ROI-to-ROI results for all three conditions using CONN.
3. Update the input directory in the MATLAB script to match the location of your CONN results.
4. Run `extract_fc_all_conditions.m`.
5. The script generates an Excel file containing the extracted connectivity values.


## Research Context

This script was developed in connection with my MSc thesis in Cognitive Sciences (Cognitive Psychology):

**Thesis Title:**

*Comparison of Default Mode Network (DMN) Activity During Emotional Stimulus Processing in Patients with Depression and Healthy Controls*

The research investigates differences in DMN activity during emotional stimulus processing between patients with depression and healthy controls.

This script supports the extraction and organization of ROI-to-ROI functional connectivity measures for subsequent statistical analysis.

## Author

**Mohadeseh Oruji**

MSc in Cognitive Sciences | Cognitive Psychology

Research Interests: Functional Neuroimaging, Functional Connectivity, Cognitive Neuroscience, and Computational Neuroscience.
