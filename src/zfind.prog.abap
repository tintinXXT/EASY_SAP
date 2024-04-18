*&---------------------------------------------------------------------*
*& Report ZFIND
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFIND.

********FIND********

DATA LV_D1 TYPE STRING VALUE 'HY THERE! My young padawan'.
DATA LV_D2 TYPE I.

*Ele acha a posição em que o meu My começa

FIND 'My' IN LV_D1 MATCH OFFSET LV_D2.

Write: / 'idex value of sap is', LV_D2.

FIND 'young' in LV_D1.

IF sy-subrc = 0.
Write / 'Its young!'.
else.
 Write / 'It didnt find'.
ENDIF.

*********REPLACE***********
*REPLACE ALL OCCURRENCES OF -> esse é para todas as ocorrecias
*REPLACE FIRST OCCURRENCE OF -> SÓ A PRIMEIRA

IF sy-subrc = 0.
  REPLACE 'young' IN LV_D1 WITH 'old'.

  WRITE / LV_D1. "--> Resultado, my old padawan."

ENDIF.


**********SHIFT**********
DATA LV_D3(20) TYPE C VALUE '123456789'.

Write: / 'BEFORE SHIFT', LV_D3.

SHIFT LV_D3 LEFT BY 3 PLACES.

Write: / 'AFTER SHIFT', LV_D3.
