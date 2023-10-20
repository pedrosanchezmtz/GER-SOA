xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace aud="http://soa.estrellaroja.com.mx/AuditControlTec";
(:: import schema at "oramds:/apps/OSB/AuditControlTec/AuditControlTec.xsd" ::)
declare namespace ele="http://soa.estrellaroja.com.mx/ElectronicInvoiceAP";
(:: import schema at "../../Schemas/ElectronicInvoiceAP.xsd" ::)
declare namespace inv="http://soa.estrellaroja.com.mx/InvoicesBiz";
(:: import schema at "oramds:/apps/SOA/INER_InvoicesBiz/InvoicesBiz.xsd" ::)

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
                <aud:ObjectVersionNumber>{xs:long(1)}</aud:ObjectVersionNumber>
                <aud:InvoiceId>{fn:data($input/inv:InvoiceId)}</aud:InvoiceId>
                <aud:EmisorRFC>{fn:data($Payment/ele:RfcIssuer)}</aud:EmisorRFC>
                <aud:ReceptorRFC>{fn:data($Payment/ele:RfcReceiver)}</aud:ReceptorRFC>
                <aud:Amount>{xs:double($Payment/ele:TotalAmount)}</aud:Amount>
                <aud:UUID>{fn:data($Payment/ele:Uuid)}</aud:UUID>
                <aud:Status>{xs:string('VALIDADO')}</aud:Status>
                <aud:BusinessUnit>{xs:string($input/inv:BusinessUnit)}</aud:BusinessUnit>
                <aud:InvoiceNumber>{fn:data($input/inv:InvoiceNumber)}</aud:InvoiceNumber>
                <aud:SuplierNumber>{xs:string($input/inv:SupplierNumber)}</aud:SuplierNumber>
            </aud:Invoice>
        }
    </aud:Invoices>
</aud:MergeInvoicesAPRq>
};

local:funcXqyuploadattachmentsrs_to_wsauditcontroltecmergeinvoicesaprq($varUploadAttachmentsRs, $varValidatePaymentRq, $inputVariable.payload)
