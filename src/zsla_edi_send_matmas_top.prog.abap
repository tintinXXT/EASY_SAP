*&---------------------------------------------------------------------*
*& Include ZSLA_EDI_SEND_MATMAS_TOP
*&---------------------------------------------------------------------*

TYPES:
BEGIN OF ty_matmas,
  mandt TYPE mara-mandt,
  matnr TYPE mara-matnr,
  werks type mard-werks,
END   OF ty_matmas.

TYPES: tt_matmas TYPE STANDARD TABLE OF ty_matmas.

DATA: t_matmas TYPE tt_matmas.

DATA:
 o_edi_send_dep_external TYPE REF TO ZEDI_SEND_DEP_EXTERNAL.
