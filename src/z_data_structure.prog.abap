*&---------------------------------------------------------------------*
*& Report Z_DATA_STRUCTURE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_DATA_STRUCTURE.




DATA : BEGIN OF ST1,
      FIRST TYPE I,
      SECOND(20) TYPE C,
      THIRD TYPE STRING,
      FOURTH TYPE P DECIMALS 2,
  END OF ST1.  "Declaration of structure using data keyword



ST1-FIRST = 1001.
ST1-SECOND = 'HELLO USER'.
ST1-THIRD = 'WELCOME'.
ST1-FOURTH = '2.01'. "Decimal sempre  entre  aspas simles"

WRITE : / 'VALUE OF FIRST VARIABLE IS',  ST1-FIRST.
WRITE : / 'VALUE OF SECOND VARIABLE IS', ST1-SECOND.
WRITE : / 'VALUE OF FTHIRD VARIABLE IS', ST1-THIRD.
WRITE : / 'VALUE OF FOURTH VARIABLE IS', ST1-FOURTH.

ULINE.

*DATA ST2 LIKE ST1. "Aqui eu igualei a forma da estrutura, e só acontece se estiver igual as estruturas"

*ST2 = ST1. "*option 1 "  - "Aqui eu igualei os valores dos campos"
*
*WRITE : / 'VALUE OF FIRST VARIABLE IS',  ST2-FIRST.
*WRITE : / 'VALUE OF SECOND VARIABLE IS', ST2-SECOND.
*WRITE : / 'VALUE OF FTHIRD VARIABLE IS', ST2-THIRD.
*WRITE : / 'VALUE OF FOURTH VARIABLE IS', ST2-FOURTH.

*MOVE ST1 TO ST2. "OPTION 2"
*
*WRITE : / 'VALUE OF FIRST VARIABLE IS',  ST2-FIRST.
*WRITE : / 'VALUE OF SECOND VARIABLE IS', ST2-SECOND.
*WRITE : / 'VALUE OF FTHIRD VARIABLE IS', ST2-THIRD.
*WRITE : / 'VALUE OF FOURTH VARIABLE IS', ST2-FOURTH.

*MOVE-CORRESPONDING ST1 TO ST2. "OPTION 3"
*
*WRITE : / 'VALUE OF FIRST VARIABLE IS',  ST2-FIRST.
*WRITE : / 'VALUE OF SECOND VARIABLE IS', ST2-SECOND.
*WRITE : / 'VALUE OF FTHIRD VARIABLE IS', ST2-THIRD.
*WRITE : / 'VALUE OF FOURTH VARIABLE IS', ST2-FOURTH.
