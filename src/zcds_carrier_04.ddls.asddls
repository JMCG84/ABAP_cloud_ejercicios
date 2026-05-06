
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds de la tabla dmo_carrier(aerolineas)'

define view entity ZCDS_Carrier_04 as select from /dmo/carrier





{       key carrier_id as identificador,
        name as nombre,
        currency_code as moneda
    
}

