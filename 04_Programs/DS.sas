/**************************************************************************
Program     : DS.sas
Study       : ABC101-RA-301
Sponsor     : ABC Biopharmaceuticals Inc.
Protocol    : ABC101-RA-301
Domain      : DS
Standard    : SDTMIG v3.3
Author      : Abhijeet Bagal
Created     : 2026
Purpose     : Create SDTM DS Domain
**************************************************************************/



%include "/home/u64481440/CLINICALSAS/ABC101-RA-301/01_Project_Setup/setup.sas";


proc import
    datafile="/home/u64481440/CLINICALSAS/ABC101-RA-301/02_Raw_Data/RAW_DS.xlsx"
    out=RAW.RAW_DS
    dbms=xlsx
    replace;
    getnames=yes;
run;



data DS_PRE;

    set RAW.RAW_DS;

    length
        DOMAIN $2
        DSTERM $200
        DSDECOD $100
        DSCAT $40
        DSSCAT $40
        DSSTDTC $20
        DSREAS $200
        EPOCH $20
        COMPLETED $1
        DEATH $1
        DEATHDT $20
        WITHDRAWN $1
        WITHDRAWRS $200;

    DOMAIN = "DS";

    DSSEQ = DSSEQ_RAW;

run;


data SDTM.DS;

    retain
        STUDYID
        DOMAIN
        USUBJID
        DSSEQ
        DSTERM
        DSDECOD
        DSCAT
        DSSCAT
        DSSTDTC
        DSREAS
        EPOCH;

    set DS_PRE;

    keep
        STUDYID
        DOMAIN
        USUBJID
        DSSEQ
        DSTERM
        DSDECOD
        DSCAT
        DSSCAT
        DSSTDTC
        DSREAS
        EPOCH;

run;


proc contents data=SDTM.DS varnum;
run;

proc print data=SDTM.DS(obs=20);
run;