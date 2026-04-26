CLASS zcl_tablas_jmcg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_tablas_jmcg IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " Declaración de tipo
*    TYPES: BEGIN OF ty_alumnos,
*             nombre TYPE string,
*             edad   TYPE i,
*             ciudad TYPE string,
*           END OF ty_ALUMNOS.
*
*    " Estructuras
*    DATA ls_alumnos TYPE ty_alumnos.
*
*    " Tablas
*    DATA: lt_alumnos TYPE TABLE OF ty_alumnos,
*          lt_alumnos_aux TYPE TABLE OF ty_alumnos.
*
*    ls_alumnos-nombre = 'Juan'.
*    ls_alumnos-edad = 23.
*    ls_alumnos-ciudad = 'Madrid'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    ls_alumnos-nombre = 'Maria'.
*    ls_alumnos-edad = 25.
*    ls_alumnos-ciudad = 'Barcelona'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    ls_alumnos-nombre = 'Jorge'.
*    ls_alumnos-edad = 27.
*    ls_alumnos-ciudad = 'Valencia'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    LOOP AT lt_alumnos INTO ls_alumnos.
*      IF ls_alumnos-edad > 25.
*        APPEND ls_alumnos TO lt_alumnos_aux.
*      ENDIF.
*    ENDLOOP.
*
*    out->write( lt_alumnos_aux ).

*    DATA lt_numeros TYPE TABLE OF i. " Declaración de una tabla INTERNA de tipo entero
*
*    APPEND 1 TO lt_numeros.
*    APPEND 2 TO lt_numeros.
*    APPEND 3 TO lt_numeros.
*    APPEND '4' TO lt_numeros.
*    APPEND 5 TO lt_numeros.
*    APPEND 6 TO lt_numeros.
*    APPEND 7 TO lt_numeros.
*    APPEND 8 TO lt_numeros.
*    APPEND 9 TO lt_numeros.
*    APPEND 10 TO lt_numeros.
*
*    out->write( lt_numeros ).

*    DATA lt_vuelos TYPE TABLE OF /dmo/flight. " Declaración de tabla tipo FLIGHT
*    DATA ls_vuelos TYPE /dmo/flight.          " Declaración de estructura tipo FLIGHT
*    DATA lv_total TYPE /dmo/flight-price.
*    SELECT * FROM /dmo/flight
*        WHERE carrier_id = 'AA'
*        INTO TABLE @lt_vuelos.
*    IF sy-subrc = 0.
*      LOOP AT lt_vuelos INTO ls_vuelos.
*        lv_total = lv_total + ls_vuelos-price.
*      ENDLOOP.
*      out->write( | La suma de todos los vuelos es { lv_total } | ).
*    ELSE.
*      out->write( 'No existen vuelos' ).
*    ENDIF.


*    SELECT SUM( price ) FROM /dmo/flight INTO @DATA(lv_acumulado).
*    out->write( | El acumulado es { lv_acumulado } | ).

*    SELECT * FROM /dmo/agency INTO TABLE @DATA(lt_agencias).
*    IF sy-subrc = 0.

*      " Modo R3
*      READ TABLE lt_agencias INTO DATA(ls_agencia)
*          WITH KEY name = 'Bella Italia'.
*      IF sy-subrc = 0.
*        out->write( ls_agencia ).
*      ELSE.
*        out->write( 'La agencia no existe' ).
*      ENDIF.

*      " Modo S4
*      TRY.
*          DATA(ls_agencia) = lt_agencias[ postal_code = '01069' ].
*        CATCH cx_sy_itab_line_not_found.
*          out->write( 'La agencia no existe' ).
*      ENDTRY.
*      out->write( ls_agencia ).
*
*
*    ELSE.
*      out->write( 'No hay agencias' ).
*    ENDIF.
*
*    SELECT SINGLE * FROM /dmo/agency
*        WHERE postal_code = '01069'
*        INTO @DATA(ls_agencia_2).
*    IF sy-subrc = 0.
*      out->write( | --------- | ).
*      out->write( ls_agencia ).
*    ENDIF.


* https://claude.ai/share/87973964-d93e-4a8a-bc6d-b617ef112346



*    DATA lt_agencias TYPE TABLE OF /dmo/agency.
*    DATA ls_agencia TYPE /dmo/agency.
*
*    SELECT * FROM /dmo/agency INTO TABLE @lt_agencias.
*    IF sy-subrc = 0.
*
*      LOOP AT lt_agencias INTO ls_agencia.
*
*        out->write( ls_agencia ).
*
*      ENDLOOP.
*    ENDIF.
*

    " Declaración de tipo
    TYPES: BEGIN OF ty_empleados,
             id     TYPE i,
             nombre TYPE string,
             edad   TYPE i,
             ciudad TYPE string,
             sueldo TYPE i,
           END OF ty_empleados.

    DATA ls_empleados TYPE ty_empleados.

    DATA: lt_empleados TYPE TABLE OF ty_empleados.

    ls_empleados-id = 1.
    ls_empleados-nombre = 'Juan'.
    ls_empleados-edad = 23.
    ls_empleados-ciudad = 'Madrid'.
    ls_empleados-sueldo = 1000.

    APPEND ls_empleados TO lt_empleados.

    ls_empleados-id = 2.
    ls_empleados-nombre = 'Maria'.
    ls_empleados-edad = 25.
    ls_empleados-ciudad = 'Barcelona'.
    ls_empleados-sueldo = 2000.

    APPEND ls_empleados TO lt_empleados.

    ls_empleados-id = 3.
    ls_empleados-nombre = 'Luis'.
    ls_empleados-edad = 27.
    ls_empleados-ciudad = 'Galicia'.
    ls_empleados-sueldo = 1500.

    APPEND ls_empleados TO lt_empleados.

    ls_empleados-id = 4.
    ls_empleados-nombre = 'Pepa'.
    ls_empleados-edad = 50.
    ls_empleados-ciudad = 'Valencia'.
    ls_empleados-sueldo = 2000.

    APPEND ls_empleados TO lt_empleados.

    ls_empleados-id = 5.
    ls_empleados-nombre = 'Miriam'.
    ls_empleados-edad = 27.
    ls_empleados-ciudad = 'Caceres'.
    ls_empleados-sueldo = 1800.

    APPEND ls_empleados TO lt_empleados.

    ls_empleados-id = 6.
    ls_empleados-nombre = 'Antonio'.
    ls_empleados-edad = 41.
    ls_empleados-ciudad = 'Sevilla'.
    ls_empleados-sueldo = 3000.

    APPEND ls_empleados TO lt_empleados.

    ls_empleados-id = 7.
    ls_empleados-nombre = 'Carlos'.
    ls_empleados-edad = 30.
    ls_empleados-ciudad = 'Granada'.
    ls_empleados-sueldo = 3000.

    APPEND ls_empleados TO lt_empleados.

    ls_empleados-id = 8.
    ls_empleados-nombre = 'Victoria'.
    ls_empleados-edad = 27.
    ls_empleados-ciudad = 'Madrid'.
    ls_empleados-sueldo = 1750.

    APPEND ls_empleados TO lt_empleados.

    ls_empleados-id = 9.
    ls_empleados-nombre = 'Daniel'.
    ls_empleados-edad = 22.
    ls_empleados-ciudad = 'Valencia'.
    ls_empleados-sueldo = 1450.

    APPEND ls_empleados TO lt_empleados.


    out->write( lt_empleados ).

    LOOP AT lt_empleados INTO DATA(ls_emp) WHERE sueldo > 1800.

      out->write( |Nombre: { ls_emp-nombre } - Sueldo: { ls_emp-sueldo }| ).

    ENDLOOP.



*ejercicio 2
    DATA lt_conexiones TYPE TABLE OF /dmo/connection.

    SELECT * FROM /dmo/connection INTO TABLE @lt_conexiones.
    IF sy-subrc = 0.
      out->write( 'Datos encontrados exitosamente:' ).
      out->write( lt_conexiones ).

    ELSE.
      out->write( 'No se encontraron datos.' ).
    ENDIF.

*ejercicio 3

*Declaramos la tabla y la variable acumuladora (tipo p para decimales)

    DATA lv_distancia_total TYPE p DECIMALS 2.

*Cargamos los datos
    SELECT * FROM /dmo/connection INTO TABLE @lt_conexiones.

    IF sy-subrc = 0.

      LOOP AT lt_conexiones INTO DATA(ls_conn).

* Acumulamos el valor de la columna 'distance'
        lv_distancia_total = lv_distancia_total + ls_conn-distance.

      ENDLOOP.

      out->write( |Distancia acumulada de todas las rutas: { lv_distancia_total }| ).

    ELSE.
      out->write( 'No se pudieron leer las conexiones.' ).
    ENDIF.










  ENDMETHOD.





ENDCLASS.
