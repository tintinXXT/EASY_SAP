*&---------------------------------------------------------------------*
*& Report ZINTERNAL_TABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zinternal_table.


*Tabela interna sem header:
*Use uma tabela interna sem header quando você precisa armazenar uma lista simples de elementos do mesmo tipo.
*Isso é útil quando você precisa apenas de uma coleção de dados sem informações adicionais associadas a eles.
*
*
*Tabela interna com header:
*Use uma tabela interna com header quando você precisa armazenar dados que possuem campos distintos e/ou informações adicionais associadas a cada linha.
*É útil quando você precisa representar estruturas de dados mais complexas, semelhantes a uma linha de banco de dados ou uma entrada em um formulário.


TYPES : BEGIN OF st_st1,
      field1 TYPE i,
      field2 TYPE string,
      field3(20) TYPE c,
      END OF st_st1.

"Usamos ty table of quando formos usar iternal table"

DATA : it_st1 TYPE TABLE OF st_st1 WITH HEADER LINE,  "
       it_st2 TYPE TABLE OF st_st1, "WITHOUT HEADER"
       wa_st2 TYPE st_st1.

it_st1-field1 = 10.
it_st1-field2 = 'Hello world!'.
it_st1-field3 = 'Hello there!'.

APPEND it_st1.

it_st1-field1 = 11.
it_st1-field2 = 'Hello world!'.
it_st1-field3 = 'Hello there!'.

APPEND it_st1.

it_st1-field1 = 12.
it_st1-field2 = 'Hello world!'.
it_st1-field3 = 'Hello there!'.

APPEND it_st1.

LOOP AT it_st1.
WRITE:/ it_st1-field1, it_st1-field2, it_st1-field3.
ENDLOOP.

ULINE.

*----;
wa_st2-field1 = 14.
wa_st2-field2 = 'Hello world!'.
wa_st2-field3 = 'Hello there!'.

APPEND wa_st2 to it_st2.
*----;
wa_st2-field1 = 15.
wa_st2-field2 = 'Hello world!'.
wa_st2-field3 = 'Hello there!'.

APPEND wa_st2 to it_st2.
*----;
wa_st2-field1 = 16.
wa_st2-field2 = 'Hello world!'.
wa_st2-field3 = 'Hello there!'.

APPEND wa_st2 to it_st2.
*----;

LOOP AT it_st2 into wa_st2.

  write : / wa_st2-field1, wa_st2-field2, wa_st2-field3.

ENDLOOP.



**********How to find the number of record in the it**********

*(1) option

ULINE.
DESCRIBE TABLE it_st2.

WRITE :/ '(1)Number of records', sy-tfill.

*(2) option

ULINE.

DATA lv_count type i.
lv_count = LINES( it_st2 ).


WRITE :/ '(2)Numer of records:', lv_count.

*(3) option

ULINE.

DATA lv_count1 type i.
lv_count1 = LINES( it_st2 ).

DESCRIBE TABLE it_st2 LINES lv_count1.

WRITE :/ '(3)Numer of records:', lv_count1.


**********(1) Assigning DATA between Internal tables***********


 DATA : it_st3 TYPE TABLE OF st_st1.
 DATA lv_count2 type i.

 lv_count2 = LINES( it_st1 ).


 it_st3[] = it_st1[]. " Usar [] para igualar body de uma tabela com header para uma sem


 DESCRIBE TABLE it_st3 LINES lv_count2.
 ULINE.
 WRITE :/ '(4)Numer of records with assignment:', lv_count2.

***********(2) Assigning DATA between Internal tables***********

  DATA lv_count3 type i.
  DATA it_st4 TYPE TABLE OF st_st1.


 APPEND LINES OF it_st1 TO it_st4. "Only lines, not header"
 DESCRIBE TABLE it_st4 LINES lv_count3.
 ULINE.
 WRITE :/ '(4)Numer of records with assignment lines of:', lv_count3.

* ***********(3) Assigning a particular range value***********
 DATA lv_count4 type i.
 DATA it_st5 TYPE TABLE OF st_st1.

 APPEND LINES OF it_st1 FROM 2 to 3 to it_st5.

 DESCRIBE TABLE it_st5 LINES lv_count4.
 ULINE.
 WRITE :/ '(5)Numer of records with assignment lines of specif values:', lv_count4.
