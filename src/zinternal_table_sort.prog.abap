*&---------------------------------------------------------------------*
*& Report ZINTERNAL_TABLE_SORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zinternal_table_sort.


TYPES : BEGIN OF st_brazil,
      pincode TYPE i,
      cname(20) TYPE c,
      ctype(20) TYPE c,
  END OF st_brazil.


  DATA : it_brazil TYPE TABLE OF st_brazil,
         wa_brazil TYPE st_brazil.

  wa_brazil-pincode = 5543.
  wa_brazil-cname = 'Londrina'.
  wa_brazil-ctype = 'Uber'.


  APPEND wa_brazil TO it_brazil.

  CLEAR wa_brazil.

  wa_brazil-pincode = 5511.
  wa_brazil-cname = 'São Paulo'.
  wa_brazil-ctype = 'Uber'.


  APPEND wa_brazil TO it_brazil.

  CLEAR wa_brazil.

  wa_brazil-pincode = 5535.
  wa_brazil-cname = 'Minas Gerais'.
  wa_brazil-ctype = 'Uber'.

  APPEND wa_brazil TO it_brazil.

  CLEAR wa_brazil.

  wa_brazil-pincode = 5545.
  wa_brazil-cname = 'Curitiba'.
  wa_brazil-ctype = 'Uber'.

  APPEND wa_brazil TO it_brazil.

  CLEAR wa_brazil.

  wa_brazil-pincode = 5533.
  wa_brazil-cname = 'Brasilia'.
  wa_brazil-ctype = 'Uber'.

  APPEND wa_brazil TO it_brazil.

  CLEAR wa_brazil.

  DESCRIBE TABLE it_brazil.
  WRITE :/ 'Nº of records', sy-tfill.

  ULINE.

  LOOP AT it_brazil INTO wa_brazil.

    WRITE :/ wa_brazil-pincode, wa_brazil-cname, wa_brazil-ctype.

  ENDLOOP.

  ULINE.

"Criação de filtro para tabela interna, quando você não especifica nda no filtro ele pega a condição do primeiro elemento de de dados especificado no types.

  SORT it_brazil.

    LOOP AT it_brazil INTO wa_brazil.

    WRITE :/ wa_brazil-pincode, wa_brazil-cname, wa_brazil-ctype.

  ENDLOOP.


***************

  DATA : it_brazil2 TYPE TABLE OF st_brazil WITH KEY pincode.

  it_brazil2 = it_brazil.

  DESCRIBE TABLE it_brazil2.
  WRITE :/ 'Nº of records', sy-tfill.

  ULINE.

  LOOP AT it_brazil2 INTO wa_brazil.

    WRITE :/ wa_brazil-pincode, wa_brazil-cname, wa_brazil-ctype.

  ENDLOOP.

ULINE.

  SORT it_brazil2. "This sort consider the key field as main path

    LOOP AT it_brazil2 INTO wa_brazil.

    WRITE :/ wa_brazil-pincode, wa_brazil-cname, wa_brazil-ctype.

  ENDLOOP.

  ULINE.

   SORT it_brazil2 BY cname. "This sorte condider the specified field from the "BY" SINTAX

  LOOP AT it_brazil2 INTO wa_brazil.

    WRITE :/ wa_brazil-pincode, wa_brazil-cname, wa_brazil-ctype.

  ENDLOOP.

  ULINE.

    DESCRIBE TABLE it_brazil2.
    WRITE :/ 'Nº of records', sy-tfill.
*
*  FREE : it_brazil,
*         it_brazil2.
*

ULINE.

**************** Insert ****************

  CLEAR wa_brazil.

  wa_brazil-pincode = 325511.
  wa_brazil-cname = 'CARROÇA'.
  wa_brazil-ctype = 'Uber'.

  INSERT wa_brazil INTO TABLE it_brazil2. "Add the data on the last position"

  DESCRIBE TABLE it_brazil2.
  WRITE :/ 'Nº of records', sy-tfill.

    LOOP AT it_brazil2 INTO wa_brazil.

    WRITE :/ wa_brazil-pincode, wa_brazil-cname, wa_brazil-ctype.

  ENDLOOP.

 CLEAR wa_brazil.

  wa_brazil-pincode = 233325511.
  wa_brazil-cname = 'CARROÇA'.
  wa_brazil-ctype = 'Uber2'.

   INSERT wa_brazil INTO it_brazil2 INDEX 3.  "When using index, we should uso INTO only.

Uline.
*   **************READ TABLE******************

 CLEAR wa_brazil.
   READ TABLE it_brazil INTO wa_brazil index 4.

   IF sy-subrc = 0.
     WRITE :/ 'the value include is successfully',
            / wa_brazil-pincode,  wa_brazil-cname, wa_brazil-ctype.
     else.
       WRITE :/ 'Wrong statment'.
   ENDIF.
