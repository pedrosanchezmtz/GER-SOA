xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace inv="http://soa.estrellaroja.com.mx/InvoicesBiz";
(:: import schema at "oramds:/apps/SOA/INER_InvoicesBiz/InvoicesBiz.xsd" ::)

declare namespace est = "http://soa.estrellaroja.com.mx/EstrellaRojaCommons";

declare variable $inputVariable.payload as element() (:: schema-element(inv:ValidateInvoicesAPRq) ::) external;
declare variable $varSBpelHoldInvoicesAPRs as element() (:: schema-element(inv:ValidateInvoicesAPRs) ::) external;

declare function local:funcXqyvarsbpelholdinvoicesrs_to_inputvariable($inputVariable.payload as element() (:: schema-element(inv:ValidateInvoicesAPRq) ::), 
                                                                      $varSBpelHoldInvoicesAPRs as element() (:: schema-element(inv:ValidateInvoicesAPRs) ::)) 
                                                                      as element() (:: schema-element(inv:ValidateInvoicesAPRq) ::) {
    <inv:ValidateInvoicesAPRq>
        <inv:InvoicesAP>
            {
                for $InvoiceAP in $inputVariable.payload/inv:InvoicesAP/inv:InvoiceAP
                where not ( exists
                  (
                  for $HoldInvoiceAPErrors in $varSBpelHoldInvoicesAPRs/est:Errors/est:Error
                  where $InvoiceAP/inv:InvoiceId = xs:long($HoldInvoiceAPErrors/est:ShortDescription)
                  return
                      xs:long($HoldInvoiceAPErrors/est:ShortDescription)
                  )
                )
                return 
                <inv:InvoiceAP>
                    <inv:SupplierId>{fn:data($InvoiceAP/inv:SupplierId)}</inv:SupplierId>
                    <inv:SupplierRFC>{fn:data($InvoiceAP/inv:SupplierRFC)}</inv:SupplierRFC>
                    <inv:Total>{fn:data($InvoiceAP/inv:Total)}</inv:Total>
                    {
                        if ($InvoiceAP/inv:Subtotal)
                        then <inv:Subtotal>{fn:data($InvoiceAP/inv:Subtotal)}</inv:Subtotal>
                        else ()
                    }
                    <inv:supplierName>{fn:data($InvoiceAP/inv:SupplierName)}</inv:supplierName>
                    <inv:InvoiceDate>{fn:data($InvoiceAP/inv:InvoiceDate)}</inv:InvoiceDate>
                    <inv:CreationDate>{fn:data($InvoiceAP/inv:CreationDate)}</inv:CreationDate>
                    <inv:LastUpdateDate>{fn:data($InvoiceAP/inv:LastUpdateDate)}</inv:LastUpdateDate>
                    <inv:Status>{fn:data($InvoiceAP/inv:Status)}</inv:Status>
                    <inv:Currency>{fn:data($InvoiceAP/inv:Currency)}</inv:Currency>
                    <inv:ReceptorRFC>{fn:data($InvoiceAP/inv:ReceptorRFC)}</inv:ReceptorRFC>
                    <inv:NameRFC>{fn:data($InvoiceAP/inv:NameRFC)}</inv:NameRFC>
                    <inv:InvoiceId>{fn:data($InvoiceAP/inv:InvoiceId)}</inv:InvoiceId>
                    <inv:SupplierNumber>{fn:data($InvoiceAP/inv:SupplierNumber)}</inv:SupplierNumber>
                    <inv:InvoiceNumber>{fn:data($InvoiceAP/inv:InvoiceNumber)}</inv:InvoiceNumber>
                    {
                        if ($InvoiceAP/inv:TotalTaxAmount)
                        then <inv:TotalTaxAmount>{fn:data($InvoiceAP/inv:TotalTaxAmount)}</inv:TotalTaxAmount>
                        else ()
                    }
                    <inv:BusinessUnit>{fn:data($InvoiceAP/inv:BusinessUnit)}</inv:BusinessUnit>
                </inv:InvoiceAP>
            }
        </inv:InvoicesAP>
    </inv:ValidateInvoicesAPRq>
};

local:funcXqyvarsbpelholdinvoicesrs_to_inputvariable($inputVariable.payload, $varSBpelHoldInvoicesAPRs)
