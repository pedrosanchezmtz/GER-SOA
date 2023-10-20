xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace aud="http://soa.estrellaroja.com.mx/AuditControlTec";
(:: import schema at "oramds:/apps/OSB/AuditControlTec/AuditControlTec.xsd" ::)
declare namespace ele="http://soa.estrellaroja.com.mx/ElectronicInvoiceAP";
(:: import schema at "../../Schemas/ElectronicInvoiceAP.xsd" ::)
declare namespace inv="http://soa.estrellaroja.com.mx/InvoicesBiz";
(:: import schema at "oramds:/apps/SOA/InvoicesBiz/InvoicesBiz.xsd" ::)

declare variable $varUploadAttachmentsRs as element() (:: schema-element(ele:UploadAttachmentsRs) ::) external;
declare variable $varValidatePaymentRq as element() (:: schema-element(ele:ValidatePaymentRq) ::) external;
declare variable $inputVariable.payload as element() (:: schema-element(inv:ValidateInvoicesAPRq) ::) external;

declare function local:funcXqyuploadattachmentsrs_to_wsauditcontroltecmergeinvoicesaprq($varUploadAttachmentsRs as element() (:: schema-element(ele:UploadAttachmentsRs) ::), 
                                                                                    $varValidatePaymentRq as element() (:: schema-element(ele:ValidatePaymentRq) ::), 
                                                                                    $inputVariable.payload as element() (:: schema-element(inv:ValidateInvoicesAPRq) ::)) 
                                                                                    as element() (:: schema-element(aud:MergeInvoicesAPRq) ::) {
<aud:MergeInvoicesAPRq>
    <aud:Invoices>
        {
            for $Attachment in $varUploadAttachmentsRs/ele:Return/ele:Attachment
            where 
            exists($Attachment/ele:ValidInvoice) or exists($Attachment/ele:InvalidInvoice)
            return
              for $Payment in $varValidatePaymentRq/ele:Payment
              where $Attachment/ele:InvoiceNumber = $Payment/ele:InvoiceNumber
              return
              for $input in $inputVariable.payload/inv:InvoicesAP/inv:InvoiceAP
            where 
            $Payment/ele:InvoiceNumber =$input/inv:InvoiceNumber
            return 
            <aud:Invoice>
                <aud:CreatedBy>{xs:string('InvoicesBiz')}</aud:CreatedBy>
                <aud:CreationDate>{fn:current-dateTime()}</aud:CreationDate>
                <aud:LastUpdatedBy>{fn:data($Payment/ele:CuentaPredial)}</aud:LastUpdatedBy>
                <aud:LastUpdateDate>{fn:data($Payment/ele:FechaTimbrado)}</aud:LastUpdateDate>
                <aud:ObjectVersionNumber>{xs:long(1)}</aud:ObjectVersionNumber>
                <aud:invoiceId>{fn:data($input/inv:InvoiceId)}</aud:invoiceId>
                <aud:emisorRfc>{fn:data($Payment/ele:RfcIssuer)}</aud:emisorRfc>
                <aud:receptorRfc>{fn:data($Payment/ele:RfcReceiver)}</aud:receptorRfc>
                <aud:amount>{xs:double($Payment/ele:TotalAmount)}</aud:amount>
                <aud:uuid>{fn:data($Payment/ele:Uuid)}</aud:uuid>
                <aud:status>{xs:string('VALIDADO')}</aud:status>
                <aud:businessUnit>{xs:string($input/inv:BusinessUnit)}</aud:businessUnit>
                <aud:invoiceNumber>{fn:data($input/inv:InvoiceNumber)}</aud:invoiceNumber>
                <aud:supplierNumber>{xs:string($input/inv:SupplierNumber)}</aud:supplierNumber>
                <aud:attribute1>{fn:data($Payment/ele:RFCEmisor)}</aud:attribute1>
                <aud:attribute2>{fn:data($input/inv:Total)}</aud:attribute2>
                <aud:attribute3>{fn:data($Payment/ele:InformacionAduanera)}</aud:attribute3>
                <aud:attribute4>{fn:data($input/inv:CreationDate)}</aud:attribute4>
                <aud:attribute5>{fn:data($input/inv:SupplierName)}</aud:attribute5>
                <aud:numeroPago>{fn:data($input/inv:numeroPago)}</aud:numeroPago>
                <aud:documentoPago>{fn:data($input/inv:documentoPago)}</aud:documentoPago>
                <aud:estadoPago>{fn:data($input/inv:estadoPago)}</aud:estadoPago>
                <aud:tipoPago>{fn:data($input/inv:tipoPago)}</aud:tipoPago>
                <aud:conciliadas>{fn:data($input/inv:conciliadas)}</aud:conciliadas>
                <aud:beneficio>{fn:data($input/inv:beneficio)}</aud:beneficio>
                <aud:sitioBeneficio>{fn:data($input/inv:sitioBeneficio)}</aud:sitioBeneficio>
                <aud:fechaPago>{fn:data($input/inv:fechaPago)}</aud:fechaPago>
                <aud:monedaPago>{fn:data($input/inv:monedaPago)}</aud:monedaPago>
                <aud:direccionPago>{fn:data($input/inv:direccionPago)}</aud:direccionPago>
                <aud:noCuentaPago>{fn:data($input/inv:noCuentaPago)}</aud:noCuentaPago>
                <aud:proveedorParte>{fn:data($input/inv:proveedorParte)}</aud:proveedorParte>
                <aud:sitioProveedor>{fn:data($input/inv:sitioProveedor)}</aud:sitioProveedor>
                <aud:unidadNegocio>{fn:data($input/inv:unidadNegocio)}</aud:unidadNegocio>
                <aud:nomBancoPagador>{fn:data($input/inv:nomBancoPagador)}</aud:nomBancoPagador>
                <aud:fecPagoBanco>{fn:data($input/inv:fecPagoBanco)}</aud:fecPagoBanco>
                <aud:importePagadoBanco>{fn:data($input/inv:importePagadoBanco)}</aud:importePagadoBanco>
                <aud:cuentaBancariaPago>{fn:data($input/inv:cuentaBancariaPago)}</aud:cuentaBancariaPago>
                <aud:importPagoBanco>{fn:data($input/inv:importPagoBanco)}</aud:importPagoBanco>
                <aud:nombreActual>{fn:data($input/inv:nombreActual)}</aud:nombreActual>
                <aud:detalles>{fn:data($input/inv:detalle)}</aud:detalles>
                <aud:tercerSegmCotable>{fn:data($input/inv:tercerSegmContable)}</aud:tercerSegmCotable>
                <aud:conceptoCuenCotble3>{fn:data($input/inv:conceptoCuenCotble3)}</aud:conceptoCuenCotble3>
                <aud:quintoSegmContable>{fn:data($input/inv:quintoSegmContable)}</aud:quintoSegmContable>
                <aud:conceptoCuenContable5>{fn:data($input/inv:conceptoCuenContable5)}</aud:conceptoCuenContable5>
                <aud:tipoComprobante>{fn:data($Payment/ele:TipoDeComprobante)}</aud:tipoComprobante>
                <aud:fechaTimbrado>{fn:data($Payment/ele:FechaTimbrado)}</aud:fechaTimbrado>
                <aud:tipoRelacion>{fn:data($Payment/ele:TipoRelacion)}</aud:tipoRelacion>
                <aud:uuidRelacion>{fn:data($Payment/ele:UUIDRelacion)}</aud:uuidRelacion>
                <aud:nombreEmisor>{fn:data($Payment/ele:NomEmisor)}</aud:nombreEmisor>
                <aud:usoCfdi>{fn:data($Payment/ele:UsoCFDI)}</aud:usoCfdi>
                <aud:subtotal>{fn:data($Payment/ele:SubTotal)}</aud:subtotal>
                <aud:descuento>{fn:data($Payment/ele:Descuento)}</aud:descuento>
                <aud:totalIeps>{fn:data($Payment/ele:Importeieps)}</aud:totalIeps>
                <aud:iva16>{fn:data($Payment/ele:Impuesto)}</aud:iva16>
                <aud:retenidoIva>{fn:data($Payment/ele:RetenidoIVA)}</aud:retenidoIva>
                <aud:retenidoIsr>{fn:data($Payment/ele:RetenidoISR)}</aud:retenidoIsr>
                <aud:ish> </aud:ish>
                <aud:total>{fn:data($Payment/ele:TotalAmount)}</aud:total>
                <aud:moneda>{fn:data($Payment/ele:Moneda)}</aud:moneda>
                <aud:tipoCambio>{fn:data($Payment/ele:TipoCambio)}</aud:tipoCambio>
                <aud:formaPago>{fn:data($Payment/ele:FormaPago)}</aud:formaPago>
                <aud:metodoPago>{fn:data($Payment/ele:MetodoPago)}</aud:metodoPago>
                <aud:conceptos>{fn:data($Payment/ele:DescripcionL)}</aud:conceptos>
                <aud:combustible>{fn:data($Payment/ele:Impuestoieps)}</aud:combustible>
                <aud:iva8>{fn:data($Payment/ele:Importe)}</aud:iva8>
            </aud:Invoice>
        }
    </aud:Invoices>
</aud:MergeInvoicesAPRq>
};

local:funcXqyuploadattachmentsrs_to_wsauditcontroltecmergeinvoicesaprq($varUploadAttachmentsRs, $varValidatePaymentRq, $inputVariable.payload)
