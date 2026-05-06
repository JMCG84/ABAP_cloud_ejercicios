//@AbapCatalog.viewEnhancementCategory: [#NONE]
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'Value Help para Género'
//@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.resultSet.sizeCategory: #XS
//
//define view entity ZCE_GENERO_VH
//  as select from I_Language
//{
//      @UI.textArrangement: #TEXT_ONLY
//  key cast( 'M' as abap.char(1) ) as Value,
//      @Semantics.text: true
//      cast( 'Masculino' as abap.char(20) ) as Description
//}
//where
//  Language = $session.system_language
//union
//select from I_Language
//{
//  key cast( 'F' as abap.char(1) ) as Value,
//      cast( 'Femenino' as abap.char(20) ) as Description
//}
//where
//  Language = $session.system_language
//union
//select from I_Language
//{
//  key cast( 'X' as abap.char(1) ) as Value,
//      cast( 'No Binario' as abap.char(20) ) as Description
//}
//where
//  Language = $session.system_language  

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help para Género'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZCE_GENERO_VH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                   p_domain_name: 'ZGENERO_04' ) as Text
{
      @UI.textArrangement: #TEXT_ONLY
  key Text.value_low as Value,

      @Semantics.text: true
      Text.text      as Description
}
where
  Text.language = $session.system_language
