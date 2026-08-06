/**************************************************************************
Project     : ABC101-RA-301
Study       : ABC Biopharmaceuticals
Protocol    : ABC101-RA-301
Domain      : DM
Program     : DM.sas
Purpose     : Create SDTM DM Domain

Author      : Abhijeet Bagal
Standard    : SDTMIG 3.3
Created     : 22JUL2026
**************************************************************************/

/*-----------------------------------------------------------------------
Initialize Project
-----------------------------------------------------------------------*/

%include "/home/u64481440/CLINICALSAS/ABC101-RA-301/01_Project_Setup/setup.sas";


/**************************************************************************
STEP 2
Import RAW AE Dataset
**************************************************************************/

proc import
    datafile="/home/u64481440/CLINICALSAS/ABC101-RA-301/02_Raw_Data/RAW_DM.xlsx"
    out=RAW.RAW_DM
    dbms=xlsx
    replace;
    getnames=yes;
run;




/*-----------------------------------------------------------------------
STEP 1
Read RAW Demographics
-----------------------------------------------------------------------*/

data DM_BASE;

    set RAW.RAW_DM;

    length
        STUDYID    $20
        DOMAIN     $2
        USUBJID    $40
        SUBJID     $20
        SITEID     $10
        COUNTRY    $3
        RFICDTC    $20
        RFSTDTC    $20
        RFENDTC    $20
        RFXSTDTC   $20
        RFXENDTC   $20
        RFPENDTC   $20
        BRTHDTC    $20
        DTHDTC     $20
        DTHFL      $1
        SEX        $1
        RACE       $40
        ETHNIC     $40
        ARMCD      $20
        ARM        $40
        ACTARMCD   $20
        ACTARM     $40
        AGEU       $5;

    DOMAIN="DM";

    AGEU="YEARS";

    RFICDTC = ICDATE;

    RFSTDTC = RANDDATE;

    BRTHDTC = DOB;

    ARM = TRTARM;

    if TRTARM="ABC-101" then ARMCD="ABC101";
    else if TRTARM="Placebo" then ARMCD="PBO";

    ACTARM=ARM;

    ACTARMCD=ARMCD;

run;


/*-----------------------------------------------------------------------
QC CHECK
-----------------------------------------------------------------------*/

proc sql;

select count(*) as DM_BASE_OBS

from DM_BASE;

quit;


/*-----------------------------------------------------------------------
STEP 2
First Exposure Date
-----------------------------------------------------------------------*/

proc sort
    data=SDTM.EX
    out=EX_SORT;

by
    USUBJID
    EXSTDTC;

run;

data EX_FIRST;

    set EX_SORT;

    by USUBJID;

    if first.USUBJID;

    keep
        USUBJID
        EXSTDTC;

    rename EXSTDTC=RFXSTDTC;

run;


/*-----------------------------------------------------------------------
STEP 3
Last Exposure Date
-----------------------------------------------------------------------*/

proc sort
    data=SDTM.EX
    out=EX_SORT2;

by
    USUBJID
    descending EXENDTC;

run;

data EX_LAST;

    set EX_SORT2;

    by USUBJID;

    if first.USUBJID;

    keep
        USUBJID
        EXENDTC;

    rename EXENDTC=RFXENDTC;

run;

/*-----------------------------------------------------------------------
STEP 4
Reference End Date from DS
-----------------------------------------------------------------------*/

proc sort
    data=SDTM.DS
    out=DS_SORT;
    by USUBJID DSSTDTC;
run;

data DS_END;

    set DS_SORT;

    by USUBJID;

    if last.USUBJID;

    keep
        USUBJID
        DSSTDTC;

    rename DSSTDTC=RFENDTC;

run;


/*-----------------------------------------------------------------------
STEP 5
Death Variables
-----------------------------------------------------------------------*/

data DS_DEATH;

    set RAW.RAW_DS;

    length DTHFL $1
           DTHDTC $20;

    if upcase(DEATH)="Y" then DTHFL="Y";
    else DTHFL="";

    DTHDTC=DEATHDT;

    keep
        USUBJID
        DTHFL
        DTHDTC;

run;


/*-----------------------------------------------------------------------
STEP 6
Sort all datasets
-----------------------------------------------------------------------*/

proc sort data=DM_BASE;
    by USUBJID;
run;

proc sort data=EX_FIRST;
    by USUBJID;
run;

proc sort data=EX_LAST;
    by USUBJID;
run;

proc sort data=DS_END;
    by USUBJID;
run;

proc sort data=DS_DEATH;
    by USUBJID;
run;


/*-----------------------------------------------------------------------
STEP 7
Merge Derived Variables
-----------------------------------------------------------------------*/

data DM_FINAL_PRE;

    merge
        DM_BASE    (in=A)
        EX_FIRST
        EX_LAST
        DS_END
        DS_DEATH;

    by USUBJID;

    if A;

    RFPENDTC=RFENDTC;

run;


/*-----------------------------------------------------------------------
QC CHECK
-----------------------------------------------------------------------*/

proc sql;

title "Observation Count";

select count(*) as DM_FINAL_PRE_OBS
from DM_FINAL_PRE;

quit;


proc sql;

title "Unique Subjects";

select count(distinct USUBJID) as UNIQUE_SUBJECTS
from DM_FINAL_PRE;

quit;


proc sort
    data=DM_FINAL_PRE
    nodupkey
    dupout=DM_DUPLICATES;

by USUBJID;

run;


/*-----------------------------------------------------------------------
STEP 8
Create Final SDTM DM Dataset
-----------------------------------------------------------------------*/

data SDTM.DM;

    retain
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
        DTHDTC;

    set DM_FINAL_PRE;

    keep
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
        DTHDTC;

run;

PROC PRINT DATA=SDTM.DM;
RUN;


/*-----------------------------------------------------------------------
STEP 9
Apply Labels
-----------------------------------------------------------------------*/

proc datasets library=SDTM nolist;

modify DM;

label
STUDYID   = "Study Identifier"
DOMAIN    = "Domain Abbreviation"
USUBJID   = "Unique Subject Identifier"
SUBJID    = "Subject Identifier for the Study"
RFSTDTC   = "Subject Reference Start Date/Time"
RFENDTC   = "Subject Reference End Date/Time"
RFXSTDTC  = "Date/Time of First Study Treatment"
RFXENDTC  = "Date/Time of Last Study Treatment"
RFPENDTC  = "Date/Time of End of Participation"
RFICDTC   = "Date/Time of Informed Consent"
BRTHDTC   = "Date/Time of Birth"
AGE       = "Age"
AGEU      = "Age Units"
SEX       = "Sex"
RACE      = "Race"
ETHNIC    = "Ethnicity"
ARMCD     = "Planned Arm Code"
ARM       = "Description of Planned Arm"
ACTARMCD  = "Actual Arm Code"
ACTARM    = "Description of Actual Arm"
DTHFL     = "Subject Death Flag"
DTHDTC    = "Date/Time of Death";

quit;


/*-----------------------------------------------------------------------
STEP 10
QC - Dataset Structure
-----------------------------------------------------------------------*/

title "SDTM DM Structure";

proc contents data=SDTM.DM varnum;
run;


/*-----------------------------------------------------------------------
STEP 11
QC - Observation Count
-----------------------------------------------------------------------*/

title "Observation Count";

proc sql;

select count(*) as DM_RECORDS
from SDTM.DM;

quit;


/*-----------------------------------------------------------------------
STEP 12
QC - Unique Subjects
-----------------------------------------------------------------------*/

title "Unique Subjects";

proc sql;

select count(distinct USUBJID) as UNIQUE_SUBJECTS
from SDTM.DM;

quit;


/*-----------------------------------------------------------------------
STEP 13
QC - Missing Critical Variables
-----------------------------------------------------------------------*/

title "Missing Critical Variables";

proc means data=SDTM.DM n nmiss;

var AGE;

run;

proc freq data=SDTM.DM;

tables
SEX
RACE
ETHNIC
ARM
ACTARM
DTHFL / missing;

run;


/*-----------------------------------------------------------------------
STEP 14
Preview Dataset
-----------------------------------------------------------------------*/

title "SDTM DM Preview";

proc print data=SDTM.DM(obs=20);

run;

title;