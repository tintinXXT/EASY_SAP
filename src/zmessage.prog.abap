*&---------------------------------------------------------------------*
*& Report ZMESSAGE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMESSAGE.

PARAMETERS P_D1 TYPE I.

IF P_D1 = 100.
  MESSAGE 'THATS RIGHT!' TYPE 'S'. "SUCESS (3)"
  ELSE.
    MESSAGE 'THATS NOT 100' TYPE 'A'. "ABORT MESSAGE (5)"

ENDIF.
