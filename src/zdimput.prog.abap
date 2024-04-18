*&---------------------------------------------------------------------*
*& Report ZDIMPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZDIMPUT.

*Parameter can olny hold char8 at the string name

PARAMETERS PR_D1 TYPE I OBLIGATORY.
PARAMETERS PR_D2 TYPE I.

DATA LV_D1 TYPE I.

LV_D1 = PR_D1 + PR_D2.

MESSAGE | 'SUM RESULT IS' { LV_D1 }| TYPE 'I'.
