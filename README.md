<div align="center">

# 🧬 End-to-End Clinical SAS SDTM Project
### Rheumatoid Arthritis Clinical Trial Data Standardization

![SAS](https://img.shields.io/badge/SAS-Programming-blue)
![CDISC](https://img.shields.io/badge/CDISC-SDTM-success)
![Clinical Trials](https://img.shields.io/badge/Clinical-Trials-green)
![Portfolio](https://img.shields.io/badge/Project-Portfolio-orange)

*A complete end-to-end Clinical SAS project demonstrating industry-standard SDTM programming workflow following CDISC standards.*

</div>

---

# 📖 Project Overview

This project demonstrates a complete **Clinical SAS Programming workflow** for converting raw clinical trial data into **CDISC SDTM (Study Data Tabulation Model)** datasets.

The repository was developed to simulate how SDTM programming is performed in pharmaceutical companies and CROs. It follows an organized project structure similar to real-world clinical programming environments.

The project includes everything from project setup, raw data import, SDTM specifications, SAS programming, dataset generation, validation, documentation, and project organization.

---

# 🎯 Project Objectives

- Convert raw clinical trial data into SDTM datasets
- Follow CDISC SDTM Implementation Guide (SDTMIG)
- Build reusable Clinical SAS project architecture
- Develop standardized SAS programs
- Create SDTM specifications
- Generate submission-ready SDTM datasets
- Demonstrate industry-standard programming practices

---

# 🏥 Study Information

| Item | Details |
|------|---------|
| Study | ABC Biopharmaceuticals |
| Protocol | ABC101-RA-301 |
| Therapeutic Area | Rheumatology |
| Disease | Rheumatoid Arthritis |
| Standard | CDISC SDTMIG 3.3 |

---

# 📂 Project Structure

```
ABC101-RA-301
│
├── 01_Project_Setup
│   ├── libnames.sas
│   ├── options.sas
│   └── setup.sas
│
├── 02_Raw_Data
│   ├── RAW_DM.xlsx
│   ├── RAW_AE.xlsx
│   ├── RAW_CM.xlsx
│   ├── RAW_DS.xlsx
│   ├── RAW_EX.xlsx
│   └── Supporting SAS datasets
│
├── 03_SDTM_Specifications
│   └── DM_SDTM_Specification.xlsx
│
├── 04_Programs
│   ├── DM.sas
│   ├── AE.sas
│   ├── CM.sas
│   ├── DS.sas
│   ├── EX.sas
│   └── Create_XPT.sas
│
├── 05_QC
│
├── 06_Output
│   ├── dm.sas7bdat
│   ├── ae.sas7bdat
│   ├── cm.sas7bdat
│   ├── ds.sas7bdat
│   └── ex.sas7bdat
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
└── README.md
```

---

# 📊 SDTM Domains Developed

| Domain | Description |
|---------|-------------|
| DM | Demographics |
| AE | Adverse Events |
| CM | Concomitant Medications |
| DS | Disposition |
| EX | Exposure |

---

# 🔄 Programming Workflow

```text
Raw Excel Data
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
SAS Programming
        │
        ▼
Create SDTM Domains
        │
        ▼
Validation & QC
        │
        ▼
Final SDTM Datasets
        │
        ▼
Transport Files (XPT)
```

---

# 🛠 Technologies Used

- Base SAS
- SAS Studio (SAS OnDemand for Academics)
- DATA Step Programming
- PROC SQL
- PROC IMPORT
- SAS Formats
- SAS Macros
- CDISC SDTM
- SDTMIG 3.3
- Microsoft Excel
- Git
- GitHub

---

# 💡 Key Features

- Organized industry-style project structure
- Reusable setup program for project initialization
- Standardized library management
- Modular SAS programming
- SDTM dataset creation
- Specification-driven programming
- Output dataset generation
- Project documentation
- Validation-ready workflow
- Version control using Git & GitHub

---

# 📚 Skills Demonstrated

### Clinical Programming

- Clinical SAS Programming
- SDTM Dataset Development
- Clinical Data Standardization
- SDTM Variable Mapping
- CDISC Standards
- Clinical Trial Data Processing

### SAS Programming

- DATA Step
- PROC SQL
- PROC IMPORT
- SAS Functions
- Library Management
- Formats
- Modular Programming

### Software Engineering

- Git Version Control
- GitHub Repository Management
- Project Organization
- Documentation
- Reusable Code Design

---

# ⚠ Disclaimer

This repository was developed for educational and portfolio purposes.

The clinical datasets used in this project are simulated and do not contain any real patient information.

---

# 👨‍💻 Author

**Abhijeet Bagal**

Aspiring Clinical SAS Programmer

📧 Email: abhijeethbagal09@gmail.com

🔗 GitHub: https://github.com/abhijeethbagal

---

## ⭐ If you found this project useful, consider giving it a Star!
