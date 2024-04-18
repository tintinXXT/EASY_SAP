*&---------------------------------------------------------------------*
*& Report ZCONDENSE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcondense.

DATA:lv_d1 TYPE string VALUE '  Hello User,     Welcome to the Bazzo program',
     lv_d2 TYPE string VALUE 'Hello',
     lv_d3 TYPE string VALUE ' World',
     lv_d4 TYPE string,
     lv_d5 TYPE string,
     lv_d6 TYPE string,
     lv_d7 TYPE string VALUE 'Hello there / Padawan'.


CONDENSE  lv_d1.

WRITE lv_d1.

CONCATENATE lv_d2 lv_d3 INTO lv_d4.

WRITE / lv_d4.


*SPLIT precisa de pelo menos duas variaveis pra receber os dados, tudo depende da quantidade de referencias do AT

SPLIT  lv_d7 AT '/' INTO lv_d5 lv_d6.

Write: / lv_d5, 'my', lv_d6.
