  xquery version "1.0" encoding "utf-8";
  
  (:: OracleAnnotationVersion "1.0" ::)
  
  declare namespace ele="http://soa.estrellaroja.com.mx/ElectronicInvoiceAP";
  (:: import schema at "../../Schemas/ElectronicInvoiceAP.xsd" ::)
  declare namespace inv="http://soa.estrellaroja.com.mx/InvoicesBiz";
  (:: import schema at "oramds:/apps/SOA/INER_InvoicesBiz/InvoicesBiz.xsd" ::)
  
  declare namespace erp = "http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec";
  
  declare variable $varValidatePaymentsRs as element() (:: schema-element(ele:ValidatePaymenyRs) ::) external;
  declare variable $inputVariable.payload as element() (:: schema-element(inv:ValidateInvoicesAPRq) ::) external;
  
  declare function local:funcVarvalidatepaymentsrs_to_varcancelinvoicesrq($varValidatePaymentsRs as element() (:: schema-element(ele:ValidatePaymenyRs) ::), 
                                                                          $inputVariable.payload as element() (:: schema-element(inv:ValidateInvoicesAPRq) ::)) 
                                                                          as element() (:: schema-element(ele:CancelInvoicesAPRq) ::) {
      <ele:CancelInvoicesAPRq>
          <ele:Invoices>
              {
              
                  for $Invoice in $inputVariable.payload/inv:InvoicesAP/inv:InvoiceAP
                  where ($Invoice/inv:InvoiceId =
                  (
                  for $Payment in $varValidatePaymentsRs/ele:Return/ele:Payment
                    where string($Payment/ele:Valid) != '' and $Payment/ele:Valid = false()
                  return ($Payment/ele:InvoiceId,$Payment/ele:InvoiceId))
                  )
                  return 
                  <ele:Invoice>
                      <erp:BusinessUnitName>{fn:data($Invoice/inv:BusinessUnit)}</erp:BusinessUnitName>
                      <erp:SupplierName>{fn:data($Invoice/inv:SupplierName)}</erp:SupplierName>
                      <erp:SupplierNumber>{xs:string($Invoice/inv:SupplierNumber)}</erp:SupplierNumber>
                      <erp:InvoiceNumber>{fn:data($Invoice/inv:InvoiceNumber)}</erp:InvoiceNumber>
                  </ele:Invoice>
              }
          </ele:Invoices>
      </ele:CancelInvoicesAPRq>
  };
  
  local:funcVarvalidatepaymentsrs_to_varcancelinvoicesrq($varValidatePaymentsRs, $inputVariable.payload)
