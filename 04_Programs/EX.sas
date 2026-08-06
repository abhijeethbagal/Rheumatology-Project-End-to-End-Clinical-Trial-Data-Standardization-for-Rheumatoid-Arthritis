/**************************************************************************
Program     : EX.sas
Study       : ABC101-RA-301
Sponsor     : ABC Biopharmaceuticals Inc.
Protocol    : ABC101-RA-301
Domain      : EX
Standard    : SDTMIG v3.3
Author      : Abhijeet Bagal
Created     : 2026
Purpose     : Create SDTM EX Domain
**************************************************************************/

%include "/home/u64481440/CLINICALSAS/ABC101-RA-301/01_Project_Setup/setup.sas";


proc import
    datafile="/home/u64481440/CLINICALSAS/ABC101-RA-301/02_Raw_Data/RAW_EX.xlsx"
    out=RAW.RAW_EX
    dbms=xlsx
    replace;
    getnames=yes;
run;


data EX_PRE;

    set RAW.RAW_EX;

    length
        STUDYID $20
        DOMAIN $2
        USUBJID $30
        EXTRT $40
        EXDOSE 8
        EXDOSU $10
        EXDOSFRQ $20
        EXROUTE $20
        EXLOT $20
        EXSTDTC $20
        EXENDTC $20
        EXADJ $3
        EXREASADJ $100
        EXONGO $3;
        
/*---------------------------------------------------------
 Direct Assignments
---------------------------------------------------------*/

        
DOMAIN = "EX";
EXSEQ = EXSEQ_RAW;

run;


/*---------------------------------------------------------
 RETAIN AND KEEP AVRIABLES
---------------------------------------------------------*/

data SDTM.EX;

    retain
        STUDYID
        DOMAIN
        USUBJID
        EXSEQ
        EXTRT
        EXDOSE
        EXDOSU
        EXDOSFRQ
        EXROUTE
        EXLOT
        EXSTDTC
        EXENDTC
        EXADJ
        EXREASADJ
        EXONGO;

    set EX_PRE;

    keep
        STUDYID
        DOMAIN
        USUBJID
        EXSEQ
        EXTRT
        EXDOSE
        EXDOSU
        EXDOSFRQ
        EXROUTE
        EXLOT
        EXSTDTC
        EXENDTC
        EXADJ
        EXREASADJ
        EXONGO;

run;

proc contents data=SDTM.EX varnum;
run;

proc print data=SDTM.EX(obs=20);
run;

