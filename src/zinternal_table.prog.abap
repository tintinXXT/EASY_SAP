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
