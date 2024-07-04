class ZAPI_REST_PEDIDO definition
  public
  final
  create public .

public section.

  interfaces IF_HTTP_EXTENSION .
protected section.
private section.
ENDCLASS.



CLASS ZAPI_REST_PEDIDO IMPLEMENTATION.


method IF_HTTP_EXTENSION~HANDLE_REQUEST.

  data(v_type_crud) = server->request->get_header_field( name = `~request_method` ).

  case v_type_crud.
    when 'GET'.
      select *
      from ZMARA
      into table @data(lt_material).

      data(ls_json_response) = /ui2/cl_json=>serialize( exporting data = lt_material ).
      server->response->set_cdata( data = ls_json_response ).

    when 'POST'.
      " Obter os dados do corpo da requisição
      data(lv_request_body) = server->request->get_cdata( ).

      " Desserializar o JSON em uma estrutura ou tabela ABAP
      data: lt_material_post type table of zmara,
            ls_material_post type zmara.

      /ui2/cl_json=>deserialize(
        exporting
          json = lv_request_body
        changing
          data = lt_material_post
      ).


      loop at lt_material_post into ls_material_post.
        insert zmara from ls_material_post.
      endloop.


      if sy-subrc = 0.
        server->response->set_status( code = 201 reason = 'Material Created' ).
      else.
        server->response->set_status( code = 500 reason = 'Internal Server Error' ).
      endif.

    when others.
      server->response->set_status( code = 405 reason = 'Method Not Allowed' ).
  endcase.

endmethod.
ENDCLASS.
