/************************************************************************** 
Program Name : AE.sas 
Project      : ABC101-RA-301 
Study        : ABC101 
Domain       : AE (Adverse Events) 
Programmer   : Abhijeet Bagal 
Purpose      : Create SDTM AE Domain 
Author       : Abhijeet Bagal 
Date         : 23JUL2026 
**************************************************************************/ 


/*--------------------------------------------------------------------------- 
Initialize Project ---------------------------------------------------------------------------*/ 

%include "/home/u64481440/CLINICALSAS/ABC101-RA-301/01_Project_Setup/setup.sas"; 


/************************************************************************** 
STEP 2 
Import RAW AE Dataset 
**************************************************************************/ 

proc import 
datafile="/home/u64481440/CLINICALSAS/ABC101-RA-301/02_Raw_Data/RAW_AE.xlsx" 
out=RAW.RAW_AE 
dbms=xlsx 
replace; 
getnames=yes; 
run; 


/************************************************************************** 
STEP 3 
Create AE_BASE Dataset 
**************************************************************************/ 

data AE_BASE; 
set RAW.RAW_AE; 
run; 


/************************************************************************** 
STEP 4 
Review AE Dataset 
**************************************************************************/ 
proc contents data=AE_BASE; 
run; 


/************************************************************************** 
STEP 5 
Create DM Reference Dataset 
**************************************************************************/ 
data DM_REF; 
set SDTM.DM 
( 
keep= 
            STUDYID 
            USUBJID 
            RFSTDTC 
); 
run; 


/************************************************************************** 
STEP 6 
Sort AE and DM 
**************************************************************************/ 
proc sort data=AE_BASE; 
by USUBJID; 
run; 
proc sort data=DM_REF; 
by USUBJID; 
run; 


/************************************************************************** 
STEP 7 
Merge AE with DM 
**************************************************************************/ 
data AE_MRG; 
merge 
        AE_BASE(in=a) 
        DM_REF; 
by USUBJID; 
if a; 
run; 


/************************************************************************** 
STEP 8 
Validation 
**************************************************************************/ 
proc print data=AE_MRG(obs=10); 
var 
        USUBJID 
        AE_STARTDT 
        RFSTDTC; 
 
run; 
 
/************************************************************************** 
STEP 9 
Derive Study Day Variables 
**************************************************************************/ 
 
data AE_DER; 
 
    set AE_MRG; 
 
    /* Convert Character Dates to SAS Dates */ 
 
    AE_STDT = input(AE_STARTDT, yymmdd10.); 
    AE_ENDT = input(AE_ENDDT,   yymmdd10.); 
    RFSTDT  = input(RFSTDTC,    yymmdd10.); 
 
    /* Derive AESTDY */ 
 
    if not missing(AE_STDT) and not missing(RFSTDT) then do; 
 
        if AE_STDT >= RFSTDT then 
            AESTDY = AE_STDT - RFSTDT + 1; 
 
        else 
            AESTDY = AE_STDT - RFSTDT; 
 
    end; 
 
    /* Derive AEENDY */ 
 
    if not missing(AE_ENDT) and not missing(RFSTDT) then do; 
 
        if AE_ENDT >= RFSTDT then 
            AEENDY = AE_ENDT - RFSTDT + 1; 
 
        else 
            AEENDY = AE_ENDT - RFSTDT; 
 
    end; 
 
    drop 
        AE_STDT 
        AE_ENDT 
        RFSTDT; 
 
run; 

 
/************************************************************************** 
STEP 10 
Validate Study Days 
**************************************************************************/ 
 
proc print data=AE_DER(obs=10); 
 
    var 
 
        USUBJID 
        AE_STARTDT 
        RFSTDTC 
        AESTDY 
        AE_ENDDT 
        AEENDY; 
run; 


/************************************************************************** 
STEP 11 
Create Exposure Reference Dataset 
**************************************************************************/ 
proc sql; 
create table EX_REF as 
select 
    USUBJID, 
    min(input(EXSTDTC,yymmdd10.)) 
as FIRST_EXDT 
        format=date9., 
    max(input(EXENDTC,yymmdd10.)) 
as LAST_EXDT 
        format=date9. 
from RAW.RAW_EX 
group by USUBJID; 
quit; 


/************************************************************************** 
STEP 12 
Sort Datasets 
**************************************************************************/ 
proc sort data=AE_DER; 
by USUBJID; 
run; 

proc sort data=EX_REF; 
by USUBJID; 
run; 


/************************************************************************** 
STEP 13 
Merge AE with Exposure 
**************************************************************************/ 
data AE_FINAL; 
merge 
        AE_DER(in=a) 
 
        EX_REF; 
 
    by USUBJID; 
 
    if a; 
     
/************************************************************************** 
Derive EPOCH 
**************************************************************************/ 
 
    length EPOCH $20; 
 
    AESTDT = input(AE_STARTDT,yymmdd10.); 
 
    if not missing(AESTDT) then do; 
 
        if AESTDT < FIRST_EXDT then 
 
            EPOCH="SCREENING"; 
 
        else if FIRST_EXDT <= AESTDT <= LAST_EXDT then 
 
            EPOCH="TREATMENT"; 
 
        else if AESTDT > LAST_EXDT then 
 
            EPOCH="FOLLOW-UP"; 
 
    end; 
 
    drop 
 
        AESTDT 
        FIRST_EXDT 
        LAST_EXDT; 
 
run; 

 
/************************************************************************** 
STEP 15 
Validate EPOCH 
**************************************************************************/ 
 
proc freq data=AE_FINAL; 
 
    tables EPOCH / missing; 
 
run; 
 
proc print data=AE_FINAL(obs=20); 
 
    var 
 
        USUBJID 
        AE_STARTDT 
        EPOCH; 
 
run; 
 
 
 
/************************************************************************** 
STEP 16 
Create SDTM AE Domain 
**************************************************************************/ 
 
data SDTM.AE; 
 
    attrib 
 
    STUDYID  length=$20  label="Study Identifier" 
    DOMAIN   length=$2   label="Domain Abbreviation" 
    USUBJID  length=$40  label="Unique Subject Identifier" 
 
    AESEQ    length=8    label="Sequence Number" 
 
    AETERM   length=$200 label="Reported Term for the Adverse Event" 
 
    AEDECOD  length=$200 label="Dictionary-Derived Term" 
 
    AEBODSYS length=$100 label="Body System or Organ Class" 
 
    AESTDTC  length=$20  label="Start Date/Time of Adverse Event" 
 
    AEENDTC  length=$20  label="End Date/Time of Adverse Event" 
 
    AESTDY   length=8    label="Study Day of Start of Adverse Event" 
 
    AEENDY   length=8    label="Study Day of End of Adverse Event" 
 
    AESEV    length=$20  label="Severity/Intensity" 
 
    AESER    length=$1   label="Serious Event" 
 
    AEREL    length=$40  label="Causality" 
 
    AEOUT    length=$40  label="Outcome of Adverse Event" 
 
    AEACN    length=$40  label="Action Taken with Study Treatment" 
 
    AEENRF   length=$20  label="End Relative to Reference Period" 
 
    AESDISAB length=$1   label="Persistent or Significant Disability" 
 
    AESDTH   length=$1   label="Results in Death" 
 
    AESHOSP  length=$1   label="Requires or Prolongs Hospitalization" 
 
    AESLIFE  length=$1   label="Life Threatening" 
 
    AESCONG  length=$1   label="Congenital Anomaly or Birth Defect" 
 
    AESMIE   length=$1   label="Other Medically Important Serious Event" 
 
    EPOCH    length=$20  label="Epoch" 
    ; 
 
    retain 
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
        EPOCH; 
set AE_FINAL; 
    DOMAIN="AE"; 
    AESEQ=AESEQ_RAW; 
    AETERM=strip(AE_TERM); 
    AEDECOD=strip(AEDECOD); 
    AEBODSYS=strip(AEBODSYS); 
    AESTDTC=AE_STARTDT; 
    AEENDTC=AE_ENDDT; 
    AESEV=upcase(strip(AE_SEV)); 
    AEREL=upcase(strip(AE_REL)); 
    AEOUT=upcase(strip(AE_OUT)); 
    AEACN=upcase(strip(AE_ACTION)); 
/* Serious Event */ 
if upcase(strip(SAE_FLAG))="Y" 
then AESER="Y"; 
else AESER=""; 
/* Ongoing Event */ 
if upcase(strip(AE_ONGO))="Y" 
then AEENRF="ONGOING"; 
else AEENRF=""; 
/* Seriousness Criteria */ 
    AESDTH= 
ifc(upcase(strip(SAE_DEATH))="Y","Y",""); 
    AESHOSP= 
ifc(upcase(strip(SAE_HOSP))="Y","Y",""); 
    AESLIFE= 
ifc(upcase(strip(SAE_LIFE))="Y","Y",""); 
    AESDISAB= 
ifc(upcase(strip(SAE_DISAB))="Y","Y",""); 
    AESCONG= 
ifc(upcase(strip(SAE_CONG))="Y","Y",""); 
    AESMIE= 
ifc(upcase(strip(SAE_MIE))="Y","Y",""); 
keep 
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
        EPOCH; 
run; 


/************************************************************************** 
STEP 17 
Validation 
**************************************************************************/ 

proc contents data=SDTM.AE varnum; 
run; 
proc print data=SDTM.AE(obs=20); 
run;