*&---------------------------------------------------------------------*
*& Report ZCHECKBOX
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCHECKBOX.

PARAMETERS : P_D1 TYPE I DEFAULT 100 OBLIGATORY,
             P_D2 TYPE I DEFAULT 10 OBLIGATORY,
             P_CB1 AS CHECKBOX,
             P_CB2 AS CHECKBOX,
             P_CB3 AS CHECKBOX,
             P_CB4 AS CHECKBOX.

DATA LV_V1 TYPE I.
DATA LV_V2 TYPE I.

CASE 'X'.
  WHEN P_CB1.
    LV_V1 = P_D1 + P_D2.
  WHEN P_CB2.
    LV_V1 = P_D1 * P_D2.
  WHEN P_CB3.
    LV_V1 = P_D1 - P_D2.
  WHEN P_CB4.
    LV_V1 = P_D1 / P_D2.

ENDCASE.

Write: / LV_V1.
