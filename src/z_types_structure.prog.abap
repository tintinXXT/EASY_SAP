*&---------------------------------------------------------------------*
*& Report Z_TYPES_STRUCTURE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_TYPES_STRUCTURE.


DATA : BEGIN OF ST1,
      FIRST TYPE I,
      SECOND(20) TYPE C,
      THIRD TYPE STRING,
      FOURTH TYPE P DECIMALS 2,
  END OF ST1.  "Declaration of structure using data keyword

WRITE : / 'VALUE OF FIRST VARIABLE IS',  ST1-FIRST.
WRITE : / 'VALUE OF SECOND VARIABLE IS', ST1-SECOND.
WRITE : / 'VALUE OF FTHIRD VARIABLE IS', ST1-THIRD.
WRITE : / 'VALUE OF FOURTH VARIABLE IS', ST1-FOURTH.

ULINE.

TYPES : BEGIN OF ST2,
      FIRST TYPE I,
      SECOND(20) TYPE C,
      THIRD TYPE STRING,
      FOURTH TYPE P DECIMALS 2,
  END OF ST2.

*Diferente do DATA, os dados no type não ficam alocados na memoria.
*WRITE : / 'VALUE OF FIRST VARIABLE IS',  ST2-FIRST.
*WRITE : / 'VALUE OF SECOND VARIABLE IS', ST2-SECOND.
*WRITE : / 'VALUE OF FTHIRD VARIABLE IS', ST2-THIRD.
*WRITE : / 'VALUE OF FOURTH VARIABLE IS', ST2-FOURTH.  "Error - STRUCTURE WHICH IS DECLARED USING TYPE KEYWORD
                                                      "THERE NO MEMORY ALOLOCATED TO THE FILD OF THE STRUCTURE"

*Declare WORK AREA.

  DATA: wa_st2 TYPE ST2.

wa_st2-FIRST = 1001.
wa_st2-SECOND = 'HELLO USER'.
wa_st2-THIRD = 'WELCOME'.
wa_st2-FOURTH = '2.01'. "Decimal sempre  entre  aspas simles"

WRITE : / 'VALUE OF FIRST VARIABLE IS',  wa_st2-FIRST.
WRITE : / 'VALUE OF SECOND VARIABLE IS', wa_st2-SECOND.
WRITE : / 'VALUE OF FTHIRD VARIABLE IS', wa_st2-THIRD.
WRITE : / 'VALUE OF FOURTH VARIABLE IS', wa_st2-FOURTH.


ULINE.

DATA: wa_st3 TYPE ST2.

wa_st3 = wa_st2.

WRITE : / 'VALUE OF FIRST VARIABLE IS',  wa_st3-FIRST.
WRITE : / 'VALUE OF SECOND VARIABLE IS', wa_st3-SECOND.
WRITE : / 'VALUE OF FTHIRD VARIABLE IS', wa_st3-THIRD.
WRITE : / 'VALUE OF FOURTH VARIABLE IS', wa_st3-FOURTH.
