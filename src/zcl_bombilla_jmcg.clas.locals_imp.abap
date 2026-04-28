*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS zcl_bombilla_demo_jmcg DEFINITION.
  PUBLIC SECTION.

    METHODS:
      constructor,


      get_lugar
        EXPORTING
          o_lugar TYPE string,

      get_estado
        EXPORTING
          o_estado TYPE abap_bool,

      set_lugar
        IMPORTING
          i_lugar TYPE string,

      encender
        EXPORTING
          o_valido TYPE abap_bool,

      apagar
        EXPORTING
          o_valido TYPE abap_bool.



  PROTECTED SECTION.



  PRIVATE SECTION.

    DATA:
      lugar  TYPE string,
      estado TYPE abap_boolean.
ENDCLASS.

CLASS zcl_bombilla_demo_jmcg IMPLEMENTATION.

  METHOD constructor.
    lugar = 'salon'.
    estado = abap_false.

  ENDMETHOD.

  METHOD get_lugar.
    o_lugar = lugar.
  ENDMETHOD.

  METHOD get_estado.
    o_estado = estado.
  ENDMETHOD.

  METHOD set_lugar.
    lugar = i_lugar.
  ENDMETHOD.

  METHOD encender.
    " Miramos el atributo interno 'estado'
    IF estado = abap_false.
      estado = abap_true.
      o_valido = abap_true. " Operación realizada con éxito
    ELSE.
      o_valido = abap_false. " No se pudo encender porque ya estaba encendida
    ENDIF.
  ENDMETHOD.

  METHOD apagar.
    " Miramos el atributo interno 'estado'
    IF estado = abap_true.
      estado = abap_false.
      o_valido = abap_true. " Operación realizada con éxito
    ELSE.
      o_valido = abap_false. " No se pudo apagar porque ya estaba apagada
    ENDIF.
  ENDMETHOD.




ENDCLASS.
