xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace inv="http://soa.estrellaroja.com.mx/InvoicesBiz";
(:: import schema at "oramds:/apps/SOA/InvoicesBiz/InvoicesBiz.xsd" ::)

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
                    <inv:numeroPago>{fn:data($InvoiceAP/inv:numeroPago)}</inv:numeroPago>
                    <inv:documentoPago>{fn:data($InvoiceAP/inv:documentoPago)}</inv:documentoPago>
                    <inv:estadoPago>{fn:data($InvoiceAP/inv:estadoPago)}</inv:estadoPago>
                    <inv:tipoPago>{fn:data($InvoiceAP/inv:tipoPago)}</inv:tipoPago>
                    <inv:conciliadas>{fn:data($InvoiceAP/inv:conciliadas)}</inv:conciliadas>
                    <inv:beneficio>{fn:data($InvoiceAP/inv:beneficio)}</inv:beneficio>
                    <inv:sitioBeneficio>{fn:data($InvoiceAP/inv:sitioBeneficio)}</inv:sitioBeneficio>
                    <inv:fechaPago>{fn:data($InvoiceAP/inv:fechaPago)}</inv:fechaPago>
                    <inv:monedaPago>{fn:data($InvoiceAP/inv:monedaPago)}</inv:monedaPago>
                    <inv:direccionPago>{fn:data($InvoiceAP/inv:direccionPago)}</inv:direccionPago>
                    <inv:noCuentaPago>{fn:data($InvoiceAP/inv:noCuentaPago)}</inv:noCuentaPago>
                    <inv:proveedorParte>{fn:data($InvoiceAP/inv:proveedorParte)}</inv:proveedorParte>
                    <inv:sitioProveedor>{fn:data($InvoiceAP/inv:sitioProveedor)}</inv:sitioProveedor>
                    <inv:unidadNegocio>{fn:data($InvoiceAP/inv:unidadNegocio)}</inv:unidadNegocio>
                    <inv:nomBancoPagador>{fn:data($InvoiceAP/inv:nomBancoPagador)}</inv:nomBancoPagador>
                    <inv:fecPagoBanco>{fn:data($InvoiceAP/inv:fecPagoBanco)}</inv:fecPagoBanco>
                    <inv:importePagadoBanco>{fn:data($InvoiceAP/inv:importePagadoBanco)}</inv:importePagadoBanco>
                    <inv:cuentaBancariaPago>{fn:data($InvoiceAP/inv:cuentaBancariaPago)}</inv:cuentaBancariaPago>
                    <inv:importPagoBanco>{fn:data($InvoiceAP/inv:importPagoBanco)}</inv:importPagoBanco>
                    <inv:nombreActual>{fn:data($InvoiceAP/inv:nombreActual)}</inv:nombreActual>
                    <inv:detalle>{fn:data($InvoiceAP/inv:detalle)}</inv:detalle>
                    <inv:tercerSegmContable>{fn:data($InvoiceAP/inv:tercerSegmContable)}</inv:tercerSegmContable>
                    <inv:conceptoCuenCotble3>{fn:data($InvoiceAP/inv:conceptoCuenCotble3)}</inv:conceptoCuenCotble3>
                    <inv:quintoSegmContable>{fn:data($InvoiceAP/inv:quintoSegmContable)}</inv:quintoSegmContable>
                    <inv:conceptoCuenContable5>{fn:data($InvoiceAP/inv:conceptoCuenContable5)}</inv:conceptoCuenContable5>
                </inv:InvoiceAP>
            }
        </inv:InvoicesAP>
    </inv:ValidateInvoicesAPRq>
};

local:funcXqyvarsbpelholdinvoicesrs_to_inputvariable($inputVariable.payload, $varSBpelHoldInvoicesAPRs)
