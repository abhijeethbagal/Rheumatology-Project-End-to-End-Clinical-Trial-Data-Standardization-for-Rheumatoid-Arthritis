/**************************************************************************
 Project : ABC101-RA-301
 Program : setup.sas
**************************************************************************/

/* SAS Options */
options
        validvarname=upcase
        compress=yes
        mprint
        mlogic
        symbolgen
        msglevel=i
        nocenter
        missing=''
        formchar="|----|+|---+=|-/\<>*"
        ls=150
        ps=max
        yearcutoff=1920;

/* Project Root */

%let ROOT=/home/u64481440/CLINICALSAS/ABC101-RA-301;

/* Libraries */
libname RAW     "&ROOT/02_Raw_Data";
libname SDTM    "&ROOT/06_Output";
libname QC      "&ROOT/05_QC";
libname META    "&ROOT/12_Metadata";
libname FORMATS "&ROOT/10_Formats";

%put NOTE: =====================================;
%put NOTE: Clinical SAS Project Initialized;
%put NOTE: =====================================;