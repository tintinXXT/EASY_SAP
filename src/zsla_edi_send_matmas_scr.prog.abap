*&---------------------------------------------------------------------*
*& Include ZSLA_EDI_SEND_MATMAS_SCR
*&---------------------------------------------------------------------*
TYPES: BEGIN OF ty_sel_screen,
        matnr TYPE mara-matnr,
        ean11 TYPE mara-ean11,
        werks TYPE marc-werks,
        lgnum type mlgn-lgnum,
       END OF ty_sel_screen.

DATA: gs_sel_screen TYPE ty_sel_screen.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.

SELECT-OPTIONS:
s_matnr FOR gs_sel_screen-matnr NO INTERVALS,
s_ean11 FOR gs_sel_screen-ean11 NO INTERVALS,
s_werks FOR gs_sel_screen-werks NO INTERVALS,
s_lgnum for gs_sel_screen-lgnum NO INTERVALS.

SELECTION-SCREEN END OF BLOCK b1.
