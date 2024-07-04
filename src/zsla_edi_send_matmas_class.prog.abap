**&---------------------------------------------------------------------*
**& Include ZSLA_EDI_SEND_MATMAS_CLASS
**&---------------------------------------------------------------------*
**&---------------------------------------------------------------------*
**&  Include           /SIE/SLA_EDI_SEND_CREMAS_CLASS
**&---------------------------------------------------------------------*
*
**{   INSERT         BD1K916435                                        1
*CLASS lcl_util DEFINITION.
*
*  PUBLIC SECTION.
*    DATA: lo_instance TYPE REF TO lcl_util.
*
*    CLASS-METHODS:
*      main,
*      get_instance,
*      get_data,
*      check_data RETURNING VALUE(rv_is_initial) TYPE xfeld,
*      enviar_idoc.
*
*ENDCLASS.                    "lcl_util DEFINITION
*
*CLASS lcl_util IMPLEMENTATION .
*
*  METHOD main.
*
*    get_instance( ).
*
*    get_data( ).
*
*    IF check_data( ) EQ abap_false.
*
*      enviar_idoc( ).
*
*    ELSE.
*
*      MESSAGE e905(/sie/sla_edi) WITH 'Dados não encontrados para'
*                                      'o critério de seleção informado'.
*
*    ENDIF.
*
*  ENDMETHOD.
*
*  METHOD get_instance.
*    o_edi_send_dep_external = NEW /sie/sla_edi_send_dep_external( ).
*  ENDMETHOD.
*
*  METHOD get_data.
*
*    REFRESH: t_matmas[].
*
*    SELECT a~mandt a~matnr
*    INTO TABLE t_matmas
*    FROM mara as a
*    inner join mard as b on b~matnr = a~matnr
*    inner join mlgn as c on c~matnr = a~matnr
*      WHERE a~matnr IN s_matnr[]
*        AND a~ean11 IN s_ean11[]
*        and b~werks in s_werks[]
*        and c~lgnum in s_lgnum[].
*    IF sy-subrc EQ 0.
*      SORT t_matmas BY matnr.
*    ENDIF.
*
*  ENDMETHOD.
*
*  METHOD check_data.
*
*    IF t_matmas[] IS INITIAL.
*      rv_is_initial = abap_true.
*    ENDIF.
*
*  ENDMETHOD.
*
*  METHOD enviar_idoc.
*
*    CONSTANTS: c_msgfn_i TYPE bdimarakey-msgfn VALUE '005'.
*
*    IF o_edi_send_dep_external IS BOUND.
*
*      LOOP AT t_matmas ASSIGNING FIELD-SYMBOL(<matmas>).
*
*        DATA(f_mara) = VALUE bdimarakey(
*        mandt = <matmas>-mandt
*        matnr = <matmas>-matnr
*        msgfn = c_msgfn_i ).
*
*
*        TRY.
*            o_edi_send_dep_external->send_matmas_dep_externo( f_mara ).
*          CATCH cx_drf_process_messages .
*        ENDTRY.
*
*      ENDLOOP.
*    ENDIF.
*
*  ENDMETHOD.
*
*ENDCLASS.
**}   INSERT
*
*CLASS lcl_util IMPLEMENTATION .
*
*ENDCLASS.
