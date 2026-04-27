CLASS zcl_coche_jmcg DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.  "Interfaz obligatoria del programa de consola

    METHODS:

      constructor
        IMPORTING
          iv_marca TYPE string OPTIONAL
          iv_color TYPE string OPTIONAL,

      arrancar,

      parar,

      frenar,

      acelerar
        IMPORTING
          iv_kmh TYPE i,

      get_velocidad
        RETURNING VALUE(rv_vel) TYPE i,

      mostrar_estado
        IMPORTING
          io_out TYPE REF TO if_oo_adt_classrun_out.  "necesita la consola

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA: mv_marca     TYPE string,
          mv_color     TYPE string,
          mv_velocidad TYPE i,
          mv_encendido TYPE abap_bool.
ENDCLASS.



CLASS zcl_coche_jmcg IMPLEMENTATION.



  METHOD constructor.
    mv_marca     = iv_marca.
    mv_color     = iv_color.
    mv_velocidad = 0.
    mv_encendido = abap_false.
  ENDMETHOD.

  METHOD arrancar.
    IF mv_encendido = abap_false.
      mv_encendido = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD parar.
    IF mv_encendido = abap_true.
      mv_encendido = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD frenar.
    IF mv_encendido = abap_true.
      mv_velocidad = 0.
    ENDIF.
  ENDMETHOD.

  METHOD acelerar.
    IF mv_encendido = abap_true.
      mv_velocidad = mv_velocidad + iv_kmh.
    ENDIF.
  ENDMETHOD.

  METHOD get_velocidad.
    rv_vel = mv_velocidad.
  ENDMETHOD.

  METHOD mostrar_estado.
    io_out->write( |Marca:     { mv_marca }| ).
    io_out->write( |Color:     { mv_color }| ).
    io_out->write( |Encendido: { mv_encendido }| ).
    io_out->write( |Velocidad: { mv_velocidad } km/h| ).
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    "NEW es la forma moderna de CREATE OBJECT

    DATA lo_coche TYPE REF TO zcl_coche.
    CREATE OBJECT lo_coche
      EXPORTING
        iv_marca = 'Toyota'
        iv_color = 'Rojo'.

*    DATA(lo_coche) = NEW zcl_coche(
*      iv_marca = 'Seat'
*      iv_color = 'Rojo'
*    ).

    out->write( '--- Arrancamos ---' ).
    lo_coche->arrancar( ).
    lo_coche->mostrar_estado( io_out = out ).

    out->write( '--- Aceleramos 50 km/h ---' ).
    lo_coche->acelerar( iv_kmh = 50 ).
    lo_coche->mostrar_estado( io_out = out ).

    out->write( '--- Aceleramos 30 km/h más ---' ).
    lo_coche->acelerar( iv_kmh = 30 ).
    lo_coche->mostrar_estado( io_out = out ).

    out->write( '--- Frenamos ---' ).
    lo_coche->frenar( ).
    lo_coche->mostrar_estado( io_out = out ).

    out->write( '--- Aparcamos ---' ).
    lo_coche->parar( ).
    lo_coche->mostrar_estado( io_out = out ).
endmethod.

ENDCLASS.
