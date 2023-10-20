xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace rec="http://soa.estrellaroja.com.mx/ReceiptBiz";
(:: import schema at "oramds:/apps/SOA/INER_ReceiptBiz/ReceiptBiz.xsd", 
                     "oramds:/apps/SOA/INER_ReceiptBiz/ReceiptBiz.xsd" ::)

declare variable $varInvokeWsReceiptBizReceiptApplyRq.ReceiptApplyRq as element() (:: schema-element(rec:ReceiptApplyRq) ::) external;
declare variable $varInvokeWsReceiptBizDigitalStampReceiptsRs.DigitalStampReceiptsRs as element() (:: schema-element(rec:DigitalStampReceiptsRs) ::) external;

declare function local:funcXqtrs_errors($varInvokeWsReceiptBizReceiptApplyRq.ReceiptApplyRq as element() (:: schema-element(rec:ReceiptApplyRq) ::), 
                                        $varInvokeWsReceiptBizDigitalStampReceiptsRs.DigitalStampReceiptsRs as element() (:: schema-element(rec:DigitalStampReceiptsRs) ::)) 
                                        as element() (:: schema-element(rec:ReceiptApplyRq) ::) {
    <rec:ReceiptApplyRq>
        {
            for $ReceiptApply in $varInvokeWsReceiptBizReceiptApplyRq.ReceiptApplyRq/rec:ReceiptApply
            return 
            <rec:ReceiptApply>
                <rec:AMOUNT>{fn:data($ReceiptApply/rec:AMOUNT)}</rec:AMOUNT>
                <rec:RECEIPT_ID>{fn:data($ReceiptApply/rec:RECEIPT_ID)}</rec:RECEIPT_ID>
                <rec:RECEIPT_NUMBER>{fn:data($ReceiptApply/rec:RECEIPT_NUMBER)}</rec:RECEIPT_NUMBER>
                <rec:TRANSACTION_NUMBER>{fn:data($ReceiptApply/rec:TRANSACTION_NUMBER)}</rec:TRANSACTION_NUMBER>
                <rec:CUSTOMER_NAME>{fn:data($ReceiptApply/rec:CUSTOMER_NAME)}</rec:CUSTOMER_NAME>
                <rec:APPLICATION_DATE>{fn:data($ReceiptApply/rec:APPLICATION_DATE)}</rec:APPLICATION_DATE>
                <rec:ACCOUNTING_DATE>{fn:data($ReceiptApply/rec:ACCOUNTING_DATE)}</rec:ACCOUNTING_DATE>
                <rec:CUST_ACCOUNT_ID>{fn:data($ReceiptApply/rec:CUST_ACCOUNT_ID)}</rec:CUST_ACCOUNT_ID>
                <rec:ORGANIZATION_ID>{fn:data($ReceiptApply/rec:ORGANIZATION_ID)}</rec:ORGANIZATION_ID>
                <rec:CUSTOMER_TRX_ID>{fn:data($ReceiptApply/rec:CUSTOMER_TRX_ID)}</rec:CUSTOMER_TRX_ID>
                <rec:UUID>{fn:data($ReceiptApply/rec:UUID)}</rec:UUID>
                <rec:BUSINESS_UNIT>{fn:data($ReceiptApply/rec:BUSINESS_UNIT)}</rec:BUSINESS_UNIT>
                <rec:METODO_RECIBO>{fn:data($ReceiptApply/rec:METODO_RECIBO)}</rec:METODO_RECIBO>
                <rec:RECEIPT_APPLY_ID>{fn:data($ReceiptApply/rec:RECEIPT_APPLY_ID)}</rec:RECEIPT_APPLY_ID>
            </rec:ReceiptApply>
        }
        <rec:GetHtmlControlRq>
     <rec:ErrorsDetails>
                {
                    for $ErrorDetail in $varInvokeWsReceiptBizReceiptApplyRq.ReceiptApplyRq/rec:GetHtmlControlRq/rec:ErrorsDetails/rec:ErrorDetail
                    return 
                    <rec:ErrorDetail>
                        <rec:DataValue>{fn:data($ErrorDetail/rec:DataValue)}</rec:DataValue>
                        <rec:ErrorMessage>{fn:data($ErrorDetail/rec:ErrorMessage)}</rec:ErrorMessage>
                    </rec:ErrorDetail>
                }
				{
                    for $ErrorDetail1 in $varInvokeWsReceiptBizDigitalStampReceiptsRs.DigitalStampReceiptsRs/rec:Return/rec:GetHtmlControlRq/rec:ErrorsDetails/rec:ErrorDetail
                    return 
                    <rec:ErrorDetail>
                        <rec:DataValue>{fn:data($ErrorDetail1/rec:DataValue)}</rec:DataValue>
                        <rec:ErrorMessage>{fn:data($ErrorDetail1/rec:ErrorMessage)}</rec:ErrorMessage>
                    </rec:ErrorDetail>
                }
            </rec:ErrorsDetails>
        </rec:GetHtmlControlRq>

    </rec:ReceiptApplyRq>
};

local:funcXqtrs_errors($varInvokeWsReceiptBizReceiptApplyRq.ReceiptApplyRq, $varInvokeWsReceiptBizDigitalStampReceiptsRs.DigitalStampReceiptsRs)
