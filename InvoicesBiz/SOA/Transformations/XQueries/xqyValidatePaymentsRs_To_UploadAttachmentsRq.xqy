xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ele="http://soa.estrellaroja.com.mx/ElectronicInvoiceAP";
(:: import schema at "../../Schemas/ElectronicInvoiceAP.xsd" ::)
declare namespace inv="http://soa.estrellaroja.com.mx/InvoicesBiz";
(:: import schema at "oramds:/apps/SOA/InvoicesBiz/InvoicesBiz.xsd" ::)

declare namespace erp = "http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec";

declare variable $varValidatePaymentsRs as element() (:: schema-element(ele:ValidatePaymenyRs) ::) external;
declare variable $inputVariable.payload as element() (:: schema-element(inv:ValidateInvoicesAPRq) ::) external;
declare variable $varValidatePaymentRq as element() (:: schema-element(ele:ValidatePaymentRq) ::) external;

declare function local:funcXqyvalidatepaymentsrs_to_uploadattachmentsrq1($varValidatePaymentsRs as element() (:: schema-element(ele:ValidatePaymenyRs) ::), 
                                                                         $inputVariable.payload as element() (:: schema-element(inv:ValidateInvoicesAPRq) ::), 
                                                                         $varValidatePaymentRq as element() (:: schema-element(ele:ValidatePaymentRq) ::)) 
                                                                         as element() (:: schema-element(ele:UploadAttachmentsRq) ::) {
    <ele:UploadAttachmentsRq>
        {
            for $InvoiceAP in $inputVariable.payload/inv:InvoicesAP/inv:InvoiceAP
            for $Payment in $varValidatePaymentsRs/ele:Return/ele:Payment
            where $Payment/ele:InvoiceNumber=$InvoiceAP/inv:InvoiceNumber
            and string($Payment/ele:Valid) != ''
            return
            <erp:attachmentRows>
                <erp:UserKeyA>{fn:data($InvoiceAP/inv:BusinessUnit)}</erp:UserKeyA>
                <erp:UserKeyB>{fn:data($InvoiceAP/inv:InvoiceNumber)}</erp:UserKeyB>
                <erp:UserKeyC>{xs:string($InvoiceAP/inv:SupplierNumber)}</erp:UserKeyC>
                <erp:AttachmentType>{xs:string('TEXT')}</erp:AttachmentType>
                <erp:Title>
                {
                    let $uuid :=
                    for $PaymentRq in $varValidatePaymentRq/ele:Payment
                    where $PaymentRq/ele:InvoiceNumber = $Payment/ele:InvoiceNumber
                    return fn:data($PaymentRq/ele:Uuid)
                    
                    let $maskTitle := concat(day-from-date(current-date()),month-from-date(current-date()),year-from-date(current-date()),'_',$uuid)
                    return
                        if($Payment/ele:Valid = true()) then
                            concat('S_',$maskTitle)
                        else
                            concat('E_',$maskTitle)
                }
                </erp:Title>
                <erp:Content>{fn:data($Payment/ele:XmlContent)}</erp:Content>
                </erp:attachmentRows>
        }
    </ele:UploadAttachmentsRq>
};

local:funcXqyvalidatepaymentsrs_to_uploadattachmentsrq1($varValidatePaymentsRs, $inputVariable.payload, $varValidatePaymentRq)
