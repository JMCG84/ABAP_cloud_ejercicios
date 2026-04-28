CLASS zcl_calculadora04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      constructor IMPORTING
                    i_valor       TYPE i
                    i_propietario TYPE string,

      get_valor EXPORTING o_valor TYPE i,

      get_propietario EXPORTING o_propietario TYPE string,

      set_propietario IMPORTING i_propietario TYPE string,

      sumar IMPORTING i_valor TYPE i,


      restar IMPORTING i_valor TYPE i,

      multiplicar IMPORTING i_valor TYPE i,

      dividir IMPORTING i_valor TYPE i
              exporting o_error type abap_bool,

       reset.






  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA :
      Valor       TYPE i,
      propietario TYPE string.


ENDCLASS.



CLASS zcl_calculadora04 IMPLEMENTATION.


  METHOD constructor.
    valor = 0.
    propietario = i_propietario.
  ENDMETHOD.

  METHOD get_valor.
    o_valor = valor.
  ENDMETHOD.

  METHOD get_propietario.
    o_propietario = propietario.
  ENDMETHOD.

  METHOD set_propietario.
    propietario = i_propietario.
  ENDMETHOD.

  METHOD sumar.
    valor += i_valor.
  ENDMETHOD.

  METHOD restar.
    valor  -= i_valor.
  ENDMETHOD.

  METHOD multiplicar.
    valor  *= i_valor.
  ENDMETHOD.

  METHOD dividir.
  DATA lv_estado TYPE string.
    IF i_valor = 0.
    "mostrar un error"
    o_error = abap_true.
       else.
      valor = valor / i_valor.
    ENDIF.
  ENDMETHOD.

  Method reset.
    clear valor.

  endMETHOD.



ENDCLASS.
