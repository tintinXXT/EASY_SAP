*&---------------------------------------------------------------------*
*& Report Z_DATA_STRUCTUR_NESTED
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_DATA_STRUCTUR_NESTED.

DATA : BEGIN OF ls_1,
      FIRST TYPE I,
      SECOND(20) TYPE C,
      THIRD TYPE STRING,
      FOURTH TYPE P DECIMALS 2,
  END OF ls_1.  "Declaration of structure using data keyword



ls_1-FIRST = 1001.
ls_1-SECOND = 'HELLO USER'.
ls_1-THIRD = 'WELCOME'.
ls_1-FOURTH = '2.01'. "Decimal sempre  entre  aspas simles"

WRITE : / 'VALUE OF FIRST VARIABLE IS',  ls_1-FIRST.
WRITE : / 'VALUE OF SECOND VARIABLE IS', ls_1-SECOND.
WRITE : / 'VALUE OF FTHIRD VARIABLE IS', ls_1-THIRD.
WRITE : / 'VALUE OF FOURTH VARIABLE IS', ls_1-FOURTH.

ULINE.

*Nested Structure
DATA : BEGIN OF ls_3,
       FIRST TYPE I,
       SECOND(20) TYPE C,
  BEGIN OF ls_4,
    ls_4_FIRST TYPE STRING,
    ls_4_SECOND TYPE I,
    END OF ls_4,
    THIRD TYPE STRING,
    END OF ls_3.

 ls_3-FIRST = 100.
 ls_3-SECOND = 'Hello'.

* ls_4-FIRST = 'BYE'. "Não reconhece"
* ls_3-ls_4_FIRST = 'hello'. "Não reconhece"

 ls_3-ls_4-ls_4_FIRST = 'hello'.  "Estrutura principal + estrutura do ninho + campo do ninho

 WRITE : / 'VALUE OF FIRST VARIABLE IS',  ls_3-ls_4-ls_4_FIRST.
