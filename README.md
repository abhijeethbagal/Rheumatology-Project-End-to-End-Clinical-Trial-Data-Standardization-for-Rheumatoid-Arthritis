<div align="center">

# 🧬 Clinical Trial Data Standardization Using SAS and CDISC SDTM

![SAS](https://img.shields.io/badge/SAS-Programming-blue)
![CDISC](https://img.shields.io/badge/CDISC-SDTM-success)
![Clinical Trials](https://img.shields.io/badge/Clinical-Trials-green)
![Portfolio](https://img.shields.io/badge/Project-Portfolio-orange)

*A hands-on Clinical SAS project demonstrating clinical trial data standardization using SAS and CDISC SDTM standards.*

</div>

---

# 📖 Project Overview

This project demonstrates a **Clinical SAS Programming workflow** for converting raw clinical trial data into standardized **CDISC SDTM (Study Data Tabulation Model)** datasets.

The project follows a structured programming workflow covering raw data import, SDTM mapping, SAS programming, dataset development, validation, quality control, and clinical trial reporting outputs.

The project is designed to demonstrate practical experience with **Base SAS, PROC SQL, CDISC SDTM, SDTM variable mapping, data validation, and clinical trial data processing**.

---

# 🎯 Project Objectives

- Convert raw clinical trial data into standardized SDTM datasets
- Follow CDISC SDTM Implementation Guide (SDTMIG 3.3)
- Perform SDTM variable mapping and derivations
- Develop clinical trial datasets using Base SAS
- Apply controlled terminology and standard formats
- Perform data quality checks and validation
- Generate clinical trial listings and tables
- Demonstrate an industry-style Clinical SAS programming workflow

---

# 📂 Project Structure

```text
Clinical-Trial-Data-Standardization
│
├── 01_Project_Setup
│   └── setup.sas
│
├── 02_Raw_Data
│   ├── RAW_DM.xlsx
│   ├── RAW_AE.xlsx
│   └── Supporting Raw Data
│
├── 03_SDTM_Specifications
│
├── 04_Programs
│   ├── DM.sas
│   ├── AE.sas
│   └── Supporting SAS Programs
│
├── 05_SDTM
│   ├── DM
│   ├── AE
│   ├── CM
│   ├── DS
│   └── EX
│
├── 06_ADaM
│   └── ADSL
│
├── 07_TLF
│   ├── L1_Subject_Demographics.sas
│   └── T1_Demographics.sas
│
├── 08_QC
│
├── 09_Output
│
├── 10_Logs
│
└── README.md
📊 SDTM Domains
Domain	Description
DM	Demographics
AE	Adverse Events
CM	Concomitant Medications
DS	Disposition
EX	Exposure
🔄 Programming Workflow
Raw Clinical Trial Data
        │
        ▼
Project Initialization
        │
        ▼
Import Raw Data
        │
        ▼
Review SDTM Specifications
        │
        ▼
Variable Mapping
        │
        ▼
SAS Programming & Derivations
        │
        ▼
Create SDTM Domains
        │
        ▼
Data Validation & QC
        │
        ▼
ADaM / Reporting Data
        │
        ▼
Clinical Trial Listings & Tables
👤 DM – Demographics

The DM (Demographics) domain was developed using Base SAS and CDISC SDTM standards.

Key programming activities included:

Importing raw demographic data using PROC IMPORT
Creating the DM base dataset
Mapping raw variables to SDTM variables
Deriving subject-level identifiers
Deriving reference period dates
Deriving planned and actual treatment variables
Deriving first and last exposure dates
Deriving disposition and death-related variables
Applying ISO 8601 date formats
Creating the final SDTM DM dataset
Performing subject-level data validation and QC
DM Validation Checks
Observation count
Unique subject count
Duplicate subject check
Missing required identifiers
Missing important dates
Date consistency checks
Review of sample records
⚠️ AE – Adverse Events

The AE (Adverse Events) domain was programmed using Base SAS and SDTM standards.

Key programming activities included:

Importing raw adverse event data
Creating the AE base dataset
Mapping AE variables to SDTM variables
Merging subject reference information from DM
Deriving adverse event start and end dates
Deriving study day variables
Creating exposure reference dates
Deriving EPOCH based on study periods
Applying SDTM terminology and variable structure
Creating the final SDTM AE dataset
Performing dataset review and validation
Key AE Variables
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
EPOCH
📋 Clinical Trial Reporting

The project also includes clinical trial reporting outputs using ADaM ADSL.

Listing 1 – Subject Demographics

Created a subject-level demographic listing using the ITT population.

Variables included:

Subject ID
Treatment
Age
Age Group
Sex
Race
Ethnicity

The listing was generated using PROC REPORT and reviewed using QC checks and PROC COMPARE.

Table 1 – Demographics and Baseline Characteristics

Created a demographic and baseline characteristics table using ADSL.

The table includes summaries for:

Age
Age Group
Sex
Race
Ethnicity

The output was generated using SAS procedures including PROC FREQ, PROC TRANSPOSE, and PROC REPORT.

🛠 Technologies Used
Base SAS
SAS Studio
SAS OnDemand for Academics
DATA Step Programming
PROC SQL
PROC IMPORT
PROC SORT
PROC FREQ
PROC TRANSPOSE
PROC REPORT
PROC COMPARE
SAS Formats
CDISC SDTM
SDTMIG 3.3
ADaM
ADSL
Microsoft Excel
Git
GitHub
💡 Key Features
Structured Clinical SAS project workflow
Raw clinical data processing
SDTM variable mapping
SDTM domain programming
Subject-level data derivations
ISO 8601 date standardization
Study day derivations
Controlled terminology implementation
Exposure and disposition reference data integration
Data validation and QC
ADaM ADSL-based reporting
Clinical trial listings and tables
GitHub-based project documentation
📚 Skills Demonstrated
Clinical Programming
Clinical SAS Programming
Clinical Trial Data Processing
CDISC Standards
SDTM Programming
SDTM Variable Mapping
SDTM Domain Development
ADaM
ADSL
TLF Programming
Data Validation
Quality Control
SAS Programming
DATA Step
PROC SQL
PROC IMPORT
PROC SORT
PROC FREQ
PROC TRANSPOSE
PROC REPORT
PROC COMPARE
SAS Functions
Date Derivations
Formats
Dataset Merging
Clinical Data Standards
CDISC SDTM
SDTMIG 3.3
Controlled Terminology
ISO 8601 Date Standards
Clinical Trial Data Standardization
Software & Version Control
SAS Studio
SAS OnDemand for Academics
Microsoft Excel
Git
GitHub
Project Documentation
⚠ Disclaimer

This repository was developed for educational and portfolio purposes.

The clinical datasets used in this project are simulated and do not contain any real patient information or confidential clinical trial data.

👨‍💻 Author

Abhijeet Bagal

Aspiring Clinical SAS Programmer

📧 Email: abhijeethbagal09@gmail.com

🔗 GitHub: https://github.com/abhijeethbagal

⭐ If you found this project useful, consider giving it a Star!
