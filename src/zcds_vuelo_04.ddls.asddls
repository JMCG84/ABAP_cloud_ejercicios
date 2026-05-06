@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vuelos'


define view entity ZCDS_Vuelo_04
  as select from /dmo/flight  as vuelos
    join         /dmo/carrier as aerolineas on vuelos.carrier_id = aerolineas.carrier_id
{

  key    aerolineas.name      as Nombre,
         vuelos.connection_id as Conexion,
         vuelos.flight_date   as Fecha_Vuelo,
         vuelos.price         as Precio,
         vuelos.currency_code as Moneda




}
