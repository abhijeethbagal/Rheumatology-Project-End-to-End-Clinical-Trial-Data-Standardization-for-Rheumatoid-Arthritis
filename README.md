<div align="center">

# Clinical Trial Data Standardization Using SAS and CDISC SDTM

### End-to-End Clinical SAS Programming Project

![SAS](https://img.shields.io/badge/SAS-Programming-blue)
![CDISC](https://img.shields.io/badge/CDISC-SDTM-success)
![Clinical Trials](https://img.shields.io/badge/Clinical-Trials-green)
![Portfolio](https://img.shields.io/badge/Project-Portfolio-orange)

**A hands-on Clinical SAS project demonstrating SDTM programming, clinical data
standardization, QC, validation, and clinical trial reporting using SAS.**

</div>

---

## 📖 Project Overview

This project demonstrates an end-to-end **Clinical SAS programming workflow** for
standardizing clinical trial data according to **CDISC SDTM standards**.

The project covers the transformation of raw clinical trial data into
standardized SDTM domains using SAS programming techniques, followed by
quality control, validation, and generation of clinical trial outputs.

The project also demonstrates the transition from standardized clinical data
to analysis-oriented reporting outputs, including a **Subject Demographics
Listing** and a **Demographics and Baseline Characteristics Table**.

---

## 🎯 Project Objectives

- Standardize raw clinical trial data using CDISC SDTM principles
- Develop SDTM domains using Base SAS
- Apply variable mapping and derivation logic
- Perform clinical data transformations and date derivations
- Create subject-level identifiers and treatment-related variables
- Perform dataset-level QC and validation checks
- Generate clinical trial listings and tables
- Demonstrate an organized and reusable Clinical SAS programming workflow

---

## 🔄 Clinical SAS Programming Workflow

```text
Raw Clinical Trial Data
          │
          ▼
     Project Setup
          │
          ▼
    Raw Data Import
          │
          ▼
   Data Review & Mapping
          │
          ▼
    SAS Programming
          │
          ▼
    SDTM Domain Creation
          │
          ▼
    Derivations & Merging
          │
          ▼
       QC / Validation
          │
          ▼
    Final SDTM Datasets
          │
          ▼
   Analysis/Reporting Data
          │
          ▼
   Listings & Tables
📊 SDTM Programming
DM — Demographics

The DM programming workflow includes:

Raw DM data import using PROC IMPORT
Creation of a DM base dataset
Selection and standardization of DM variables
Derivation of DOMAIN
Derivation of reference dates
Derivation of planned treatment variables
Derivation of actual treatment variables
Derivation of first exposure date
Derivation of last exposure date
Derivation of reference end date
Derivation of death variables
Merging of intermediate datasets
Creation of the final SDTM.DM dataset
Final metadata review using PROC CONTENTS
Observation count QC
Unique subject QC
Duplicate subject QC
Required identifier checks
Missing date checks
Date consistency checks

The final DM programming includes variables such as:

STUDYID
DOMAIN
USUBJID
SUBJID
RFSTDTC
RFENDTC
RFXSTDTC
RFXENDTC
RFPENDTC
RFICDTC
BRTHDTC
AGE
AGEU
SEX
RACE
ETHNIC
ARMCD
ARM
ACTARMCD
ACTARM
DTHFL
DTHDTC
AE — Adverse Events

The AE programming workflow demonstrates:

Raw AE data import
Creation and review of the AE base dataset
Referencing SDTM DM information
Sorting and merging datasets by USUBJID
Conversion of character dates into SAS dates
Derivation of AESTDY
Derivation of AEENDY
Creation of an exposure reference dataset
Derivation of first and last exposure dates
EPOCH derivation
Seriousness-related variable derivations
Creation of the final SDTM.AE dataset
Final dataset metadata review
Output validation

Examples of programmed AE variables include:

STUDYID
DOMAIN
USUBJID
AESEQ
AETERM
AEDECOD
AEBODSYS
AESTDTC
AEENDTC
AESTDY
AEENDY
AESEV
AESER
AEREL
AEOUT
AEACN
AEENRF
AESDISAB
AESDTH
AESHOSP
AESLIFE
AESCONG
AESMIE
EPOCH
📋 Clinical Trial Reporting
Listing 1 — Subject Demographics

A subject-level demographics listing was programmed using an analysis dataset.

The listing includes:

Treatment
Subject ID
Age
Age Group
Sex
Race
Ethnicity

The workflow includes:

ADSL
  │
  ▼
ITT Population Selection
  │
  ▼
Subject Demographics Dataset
  │
  ▼
Sorting by Treatment and Subject
  │
  ▼
Final Variable Ordering
  │
  ▼
PROC REPORT
  │
  ▼
Subject Demographics Listing

QC includes comparison of the final listing dataset against the source
analysis dataset using PROC COMPARE.

📊 Table 1 — Demographics and Baseline Characteristics

A demographics and baseline characteristics table was programmed using an
analysis dataset.

The table summarizes:

Age Group
Sex
Race
Ethnicity

The programming workflow includes:

ITT population selection
Frequency summaries using PROC FREQ
Treatment-level summaries
Overall summaries
Calculation of counts and percentages
Creation of N (%) formatted values
Transposition using PROC TRANSPOSE
Construction of table components
Combination of table components
Final table structure
QC checks
Final report generation using PROC REPORT

The final output is structured by:

Characteristic
    └── Level
          ├── Treatment 1
          ├── Treatment 2
          └── Total
🛠️ SAS Programming Techniques Used
Base SAS
DATA Step Programming
SET Statement
MERGE Statement
BY-Group Processing
IF/THEN/ELSE Logic
Variable Derivation
Character Functions
Date Functions
Formats and Labels
KEEP / DROP
RETAIN
INPUT Function
IFN / IFC Functions
SAS Procedures
PROC IMPORT
PROC SORT
PROC SQL
PROC CONTENTS
PROC PRINT
PROC FREQ
PROC TRANSPOSE
PROC REPORT
PROC COMPARE
Clinical SAS
Clinical Trial Data Processing
CDISC SDTM
SDTM Variable Mapping
SDTM Domain Programming
Reference Date Derivations
Study Day Derivations
Treatment Variable Derivations
Clinical Data QC
Dataset Validation
Clinical Trial Listings
Clinical Trial Tables
📁 Project Organization
Clinical-SAS-Project
│
├── 01_Project_Setup
│   └── setup.sas
│
├── 02_Raw_Data
│   ├── RAW_DM
│   ├── RAW_AE
│   └── Other Raw Clinical Data
│
├── 03_SDTM_Specifications
│
├── 04_Programs
│   ├── DM.sas
│   ├── AE.sas
│   └── Other SAS Programs
│
├── 05_QC
│
├── 06_Output
│   ├── SDTM.DM
│   ├── SDTM.AE
│   └── Other SDTM Domains
│
├── 07_Validation
│
├── 08_Documentation
│
├── 09_Logs
│
├── 10_Formats
│
├── 11_Macros
│
├── 12_Metadata
│
├── 13_ADAM
│
└── README.md

The project setup program establishes reusable SAS libraries for RAW, SDTM,
QC, metadata, formats and ADaM data, providing a structured programming
environment.

🔍 Quality Control & Validation

QC activities demonstrated in the project include:

Dataset QC
Observation counts
Unique subject counts
Duplicate subject checks
Missing required identifiers
Missing important dates
Date consistency checks
Variable metadata review
Clinical Data Validation
Source-to-output checks
Review of derived variables
Review of date derivations
Treatment-level frequency checks
Listing row and subject counts
Source-to-listing comparison using PROC COMPARE
📚 CDISC Standards

The project follows:

CDISC SDTM
SDTMIG 3.3
CDISC-based SDTM variable structure
Standardized domain programming principles
💻 Technologies & Tools
SAS 9.4
SAS Studio
SAS OnDemand for Academics
Base SAS
PROC SQL
Microsoft Excel
Git
GitHub
CDISC SDTM
💡 Key Skills Demonstrated
Clinical SAS
Clinical SAS Programming
SDTM Programming
SDTM Mapping
Clinical Data Standardization
Clinical Trial Data Processing
Clinical Data QC
Clinical Data Validation
SAS Programming
Base SAS
DATA Step
PROC SQL
PROC SORT
PROC IMPORT
PROC FREQ
PROC TRANSPOSE
PROC REPORT
PROC COMPARE
SAS Functions
Date Derivations
BY-Group Processing
Dataset Merging
Clinical Reporting
Subject-Level Listings
Demographics Listings
Demographics Tables
Frequency Analysis
N (%) Reporting
TLF Programming
📌 Project Highlights
End-to-end clinical data standardization workflow
SDTM DM domain development
SDTM AE domain development
Clinical data derivations
Study-day calculations
Treatment and exposure-related derivations
Dataset-level QC
Clinical output validation
Subject demographics listing
Demographics and baseline characteristics table
Structured Clinical SAS project organization
⚠️ Disclaimer

This project is created for educational and portfolio purposes.

The datasets used in the project are simulated and do not contain real patient
information or confidential clinical trial data.

👨‍💻 Author

Abhijeet Bagal

Aspiring Clinical SAS Programmer

📧 Email: abhijeethbagal09@gmail.com

🔗 GitHub: https://github.com/abhijeethbagal
⭐ If you found this project useful, consider giving it a Star!
