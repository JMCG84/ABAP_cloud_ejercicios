CLASS z_cl_ejercicios_jmcg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_cl_ejercicios_jmcg IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*  Bloque 1: El Desafío de la Gestión de Coches
*Objetivo: Practicar TYPES, APPEND y filtrado con LOOP.
*
*Enunciado
*Define un tipo ty_coches con: marca, modelo, año (tipo i) y precio (tipo p decimals 2).
*
*Crea una tabla interna lt_coches y añade manualmente al menos 4 coches.
*
*Uno de esos coches debe ser un "Tesla" de "2024" con un precio de "60000".
*
*Crea una segunda tabla llamada lt_coches_nuevos.
*
*Recorre la primera tabla y, si el coche es del año 2023 o superior, añádelo a la tabla de coches nuevos.
*

    TYPES: BEGIN OF ty_coches,
             marca  TYPE string,
             modelo TYPE string,
             anio   TYPE i,
             precio TYPE p LENGTH 4 DECIMALS 2,
           END OF ty_coches.

    DATA: lt_coches        TYPE TABLE OF ty_coches,
          lt_coches_nuevos TYPE TABLE OF ty_coches.

    APPEND VALUE #( marca = 'Tesla' modelo = 'Model 3' anio = 2024 precio = 60000 ) TO lt_coches.
    APPEND VALUE #( marca = 'Seat'  modelo = 'Ibiza'   anio = 2020 precio = 15000 ) TO lt_coches.
    APPEND VALUE #( marca = 'opel' modelo = 'Astra'   anio = 2022 precio = 18000 ) TO lt_coches.
    APPEND VALUE #( marca = 'Mercedes' modelo = 'CLX'   anio = 2025 precio = 40000 ) TO lt_coches.

    LOOP AT lt_coches INTO DATA(ls_coche) WHERE anio >= 2023.
      APPEND ls_coche TO lt_coches_nuevos.
    ENDLOOP.

    out->write( lt_coches_nuevos ).



*Bloque 2: Consulta y Selección de Agencias
*Objetivo: Practicar SELECT SINGLE, SELECT con filtros y SY-SUBRC.
*
*Enunciado
*Busca en la tabla /dmo/agency una única agencia que esté en la ciudad ('City') de 'New York'.
*
*Si la encuentras, muestra su nombre.
*
*Si no la encuentras (usa SY-SUBRC), haz un SELECT de todas las agencias que estén en el país ('Country Code') 'US' y muéstralas en una tabla.
*
*

    SELECT SINGLE * FROM /dmo/agency
    WHERE city = 'New York'
    INTO @DATA(ls_agencia_ny).

    IF sy-subrc = 0.
      out->write( |Agencia encontrada: { ls_agencia_ny-name }| ).
    ELSE.
      SELECT * FROM /dmo/agency
        WHERE country_code = 'US'
        INTO TABLE @DATA(lt_us_agencies).
      out->write( lt_us_agencies ).
    ENDIF.


  ENDMETHOD.

ENDCLASS.
