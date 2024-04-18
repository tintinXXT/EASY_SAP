*&---------------------------------------------------------------------*
*& Report ZRADIO_BUTTOM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZRADIO_BUTTOM.


PARAMETERS : P_D1 TYPE I DEFAULT 100 OBLIGATORY,
             P_D2 TYPE I DEFAULT 20 OBLIGATORY,
             P_RB1 RADIOBUTTON GROUP G1,
             P_RB2 RADIOBUTTON GROUP G1,
             P_RB3 RADIOBUTTON GROUP G1,
             P_RB4 RADIOBUTTON GROUP G1,
             P_RB5 RADIOBUTTON GROUP G1 DEFAULT 'X'.

DATA LV_V1 TYPE I.

IF P_RB1 = 'X'.
  LV_V1 = P_D1 + P_D2.
  WRITE : / ' SUM RESULT IS .. ', LV_V1.
  ELSEIF P_RB2 = 'X'.
   LV_V1 = P_D1 - P_D2.
  WRITE : / ' SUBTRACTION RESULT IS .. ', LV_V1.
 ELSEIF P_RB3 = 'X'.
   LV_V1 = P_D1 * P_D2.
  WRITE : / ' PRODUCT RESULT IS .. ', LV_V1.
 ELSEIF P_RB4 = 'X'.
   LV_V1 = P_D1 / P_D2.
  WRITE : / ' DIVISION RESULT IS .. ', LV_V1.
ELSE.
  MESSAGE ' PLEASE SELECT ANY RADIO BUTTION FROM ABOVE MENTIONED 4 RADIO BUTTONS' TYPE 'I'.
ENDIF.
