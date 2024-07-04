*&---------------------------------------------------------------------*
*& Report Z_CHALLENGE_CLASS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_challenge_class.


CLASS lcl_media_idade DEFINITION.

PUBLIC SECTION. "Can be execute outside this section

TYPES : BEGIN OF st_funcionarios,
      f_name TYPE string,
      f_lname TYPE string,
      f_idade TYPE I,
      f_dep(3) TYPE c,
      END OF st_funcionarios.

TYPES : BEGIN OF st_media,
      f_media TYPE st_funcionarios-f_idade,
      END OF st_media.

DATA lv_media type p DECIMALS 2.
DATA lv_soma type i.
DATA wa_funcionarios type st_funcionarios.
DATA it_media TYPE TABLE OF st_media.
DATA it_funcionarios TYPE TABLE OF st_funcionarios.

METHODS calcula_media
    IMPORTING
        f_name TYPE string
        f_lname TYPE string
        f_idade TYPE i
        f_dep TYPE c.

PRIVATE SECTION.


  ENDCLASS.

CLASS lcl_media_idade IMPLEMENTATION.

 METHOD calcula_media.

   APPEND me->wa_funcionarios TO me->it_funcionarios.

   me->lv_soma = 0.


   LOOP AT me->it_funcionarios INTO me->wa_funcionarios.

     me->lv_soma = me->lv_soma + me->wa_funcionarios-f_idade.

   ENDLOOP.

   IF lines( me->it_funcionarios ) > 0.
     me->lv_media = me->lv_soma / lines( me->it_funcionarios ).
     else.
       Write : 'Não foi possível realizar o calculo de idade'.

   ENDIF.


  ENDMETHOD.

  ENDCLASS.


START-OF-SELECTION.

DATA lo_media type REF TO lcl_media_idade.

lo_media = new lcl_media_idade( ).

PARAMETERS : p_name  type string,
             p_lname type string,
             p_idade type I OBLIGATORY,
             p_dep   type c.

lo_media->calcula_media( f_name = p_name
                         f_lname = p_lname
                         f_idade = p_idade
                         f_dep = p_dep
                        ).


"Esse codigo está longe de entregar a proposta dele, estou parando por aqui pois acho que consegui entender o conceito geral de instanciamento simples de classe
"vou deixar ele aqui para um dia voltar a mexer.
