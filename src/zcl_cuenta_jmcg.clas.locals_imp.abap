*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS zcl_cuenta_demo_jmcg DEFINITION.

  PUBLIC SECTION.

    DATA:
      titular TYPE string,
      saldo   TYPE i.

    METHODS:
        constructor
        IMPORTING
          i_titular TYPE string
          i_saldo   TYPE i,

      get_titular
        EXPORTING
          o_titular TYPE string,

      get_saldo
        EXPORTING
          o_saldo TYPE i,

      set_titular
        IMPORTING
          i_titular TYPE string,

      set_saldo
        IMPORTING
          i_saldo TYPE i,

      ingresar
        IMPORTING
          i_cantidad TYPE i,

      retirar
        IMPORTING
          i_cantidad TYPE i
          exporTING
           o_valido type abap_bool.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cuenta_demo_jmcg IMPLEMENTATION.

method constructor.
    titular = i_titular.
    saldo = i_saldo.
  ENDMETHOD.

  METHOD get_titular.
    o_titular = titular.
  ENDMETHOD.

  METHOD get_saldo.
    o_saldo = saldo.
  ENDMETHOD.

  METHOD set_titular.
    titular = i_titular.
  ENDMETHOD.

  METHOD set_saldo.
    saldo = i_saldo.
  ENDMETHOD.

  METHOD ingresar.
    saldo = saldo + i_cantidad.
  ENDMETHOD.

  METHOD retirar.
    IF saldo >= i_cantidad.
      saldo = saldo - i_cantidad.
      else.
     o_valido = abap_false.
      endIF.


  ENDMETHOD.

ENDCLASS.
