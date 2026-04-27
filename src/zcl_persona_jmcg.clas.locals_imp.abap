*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS zcl_demo_persona DEFINITION.

  PUBLIC SECTION.
    DATA:
      nombre TYPE string,
      edad   TYPE i.

    METHODS:
      get_nombre
        EXPORTING
          o_nombre TYPE string,

      set_nombre
        IMPORTING
          i_nombre TYPE string,

      get_edad
        EXPORTING
          O_edad TYPE i,

      set_edad
        IMPORTING
          i_edad TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_demo_persona IMPLEMENTATION.

  METHOD set_nombre.
    " atributo = paraemtro de entrada
    nombre = i_nombre.
  ENDMETHOD.

  METHOD get_nombre.
    " parametro de salida = atributo
    o_nombre = nombre.
  ENDMETHOD.

    METHOD set_edad.
    " atributo = paraemtro de entrada
    edad = i_edad.
  ENDMETHOD.

  METHOD get_edad.
    " parametro de salida = atributo
    o_edad = edad.
  ENDMETHOD.

ENDCLASS.
