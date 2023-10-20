xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace rec="http://soa.estrellaroja.com.mx/ReceiptBiz";
(:: import schema at "oramds:/apps/SOA/INER_ReceiptBiz/ReceiptBiz.xsd", 
                     "oramds:/apps/SOA/INER_ReceiptBiz/ReceiptBiz.xsd" ::)
declare namespace str="http://soa.estrellaroja.com.mx/StructureTrxCust";
(:: import schema at "../../Schemas/StructureTrxCust.xsd" ::)

declare variable $varInvokeWsReceiptBizDigitalStampReceiptsRs.DigitalStampReceiptsRs as element() (:: schema-element(rec:DigitalStampReceiptsRs) ::) external;
declare variable $verTrxsReceiptApply as element() (:: schema-element(str:DATA_DS) ::) external;
declare variable $v_TolDif as xs:string external;
declare variable $v_MsjNoExist as xs:string external;
declare variable $v_MsjNoApli as xs:string external;
declare function local:funcXqtrs_validateapplys($varInvokeWsReceiptBizDigitalStampReceiptsRs.DigitalStampReceiptsRs as element() (:: schema-element(rec:DigitalStampReceiptsRs) ::), 
                                                $verTrxsReceiptApply as element() (:: schema-element(str:DATA_DS) ::)) 
                                                as element() (:: schema-element(rec:ReceiptApplyRq) ::) {
   <rec:ReceiptApplyRq>
                {
                    for $ProcessedApplyReceipt in $varInvokeWsReceiptBizDigitalStampReceiptsRs.DigitalStampReceiptsRs/rec:Return/rec:Data/rec:ProcessedApplyReceipt
                    return 
                     if(
                     number($ProcessedApplyReceipt/rec:AMOUNT) > (((number($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:EXTENDED_AMOUNT) * 100)- (number($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:AMOUNT_APPLIED)  * 100)) div 100)
                    )
                  then
                  if(
                  number($v_TolDif)  > fn:abs(number($ProcessedApplyReceipt/rec:AMOUNT) - (((number($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:EXTENDED_AMOUNT) * 100)- (number($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:AMOUNT_APPLIED)  * 100)) div 100))
                  )
                  then
                    <rec:ReceiptApply>
                        <rec:AMOUNT>{
                       
                        number($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:EXTENDED_AMOUNT)-number($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:AMOUNT_APPLIED)
                        
                        }</rec:AMOUNT>
                        <rec:RECEIPT_ID>{fn:data($ProcessedApplyReceipt/rec:RECEIPT_ID)}</rec:RECEIPT_ID>
                        <rec:RECEIPT_NUMBER>{fn:data($ProcessedApplyReceipt/rec:RECEIPT_NUMBER)}</rec:RECEIPT_NUMBER>
                        <rec:TRANSACTION_NUMBER>{fn:data($ProcessedApplyReceipt/rec:TRANSACTION_NUMBER)}</rec:TRANSACTION_NUMBER>
                        <rec:CUSTOMER_NAME>{fn:data($ProcessedApplyReceipt/rec:CUSTOMER_NAME)}</rec:CUSTOMER_NAME>
                        <rec:APPLICATION_DATE>{fn:data($ProcessedApplyReceipt/rec:APPLICATION_DATE)}</rec:APPLICATION_DATE>
                        <rec:ACCOUNTING_DATE>{fn:data($ProcessedApplyReceipt/rec:ACCOUNTING_DATE)}</rec:ACCOUNTING_DATE>
                        <rec:CUST_ACCOUNT_ID>{fn:data($ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID)}</rec:CUST_ACCOUNT_ID>
                        <rec:ORGANIZATION_ID>{fn:data($ProcessedApplyReceipt/rec:ORGANIZATION_ID)}</rec:ORGANIZATION_ID>
                        <rec:CUSTOMER_TRX_ID>{fn:data($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:ID_TRX)}</rec:CUSTOMER_TRX_ID>
                        <rec:UUID>{fn:data($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:UUID)}</rec:UUID>
                        <rec:BUSINESS_UNIT>{fn:data($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:BUSINESS_UNIT)}</rec:BUSINESS_UNIT>
                        <rec:METODO_RECIBO>{fn:data($ProcessedApplyReceipt/rec:METODO_RECIBO)}</rec:METODO_RECIBO>
                        <rec:RECEIPT_APPLY_ID>{fn:data($ProcessedApplyReceipt/rec:RECEIPT_APPLY_ID)}</rec:RECEIPT_APPLY_ID>
                    </rec:ReceiptApply>
                    else(

                    )
                    else (
                    if($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID])
                    then  
                        <rec:ReceiptApply>
                        <rec:AMOUNT>{fn:data($ProcessedApplyReceipt/rec:AMOUNT)}</rec:AMOUNT>
                        <rec:RECEIPT_ID>{fn:data($ProcessedApplyReceipt/rec:RECEIPT_ID)}</rec:RECEIPT_ID>
                        <rec:RECEIPT_NUMBER>{fn:data($ProcessedApplyReceipt/rec:RECEIPT_NUMBER)}</rec:RECEIPT_NUMBER>
                        <rec:TRANSACTION_NUMBER>{fn:data($ProcessedApplyReceipt/rec:TRANSACTION_NUMBER)}</rec:TRANSACTION_NUMBER>
                        <rec:CUSTOMER_NAME>{fn:data($ProcessedApplyReceipt/rec:CUSTOMER_NAME)}</rec:CUSTOMER_NAME>
                        <rec:APPLICATION_DATE>{fn:data($ProcessedApplyReceipt/rec:APPLICATION_DATE)}</rec:APPLICATION_DATE>
                        <rec:ACCOUNTING_DATE>{fn:data($ProcessedApplyReceipt/rec:ACCOUNTING_DATE)}</rec:ACCOUNTING_DATE>
                        <rec:CUST_ACCOUNT_ID>{fn:data($ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID)}</rec:CUST_ACCOUNT_ID>
                        <rec:ORGANIZATION_ID>{fn:data($ProcessedApplyReceipt/rec:ORGANIZATION_ID)}</rec:ORGANIZATION_ID>
                        <rec:CUSTOMER_TRX_ID>{fn:data($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:ID_TRX)}</rec:CUSTOMER_TRX_ID>
                        <rec:UUID>{fn:data($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:UUID)}</rec:UUID>
                        <rec:BUSINESS_UNIT>{fn:data($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:BUSINESS_UNIT)}</rec:BUSINESS_UNIT>
                        <rec:METODO_RECIBO>{fn:data($ProcessedApplyReceipt/rec:METODO_RECIBO)}</rec:METODO_RECIBO>
                        <rec:RECEIPT_APPLY_ID>{fn:data($ProcessedApplyReceipt/rec:RECEIPT_APPLY_ID)}</rec:RECEIPT_APPLY_ID>
                    </rec:ReceiptApply>
                    else()
                    )
                }
                <rec:GetHtmlControlRq>
<rec:ErrorsDetails>

                        {
                    for $ProcessedApplyReceipt in $varInvokeWsReceiptBizDigitalStampReceiptsRs.DigitalStampReceiptsRs/rec:Return/rec:Data/rec:ProcessedApplyReceipt
                    return 
                     if(
                     number($ProcessedApplyReceipt/rec:AMOUNT) > (((number($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:EXTENDED_AMOUNT) * 100)- (number($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:AMOUNT_APPLIED)  * 100)) div 100)
                    )
                  then
                  if(
                  number($v_TolDif)  > fn:abs(number($ProcessedApplyReceipt/rec:AMOUNT) - (((number($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:EXTENDED_AMOUNT) * 100)- (number($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]/str:AMOUNT_APPLIED)  * 100)) div 100))
                  )
                  then()
                    else(
                          <rec:ErrorDetail>
                                <rec:DataValue>{fn:concat('APP{',$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER,'} - REC{',$ProcessedApplyReceipt/rec:RECEIPT_NUMBER,'}')}</rec:DataValue>
                                <rec:ErrorMessage>{$v_MsjNoApli}</rec:ErrorMessage>
                           </rec:ErrorDetail>
                    )
                    else (
                    if(not($verTrxsReceiptApply/str:CUSTOMER_TRX[str:TRX_NUMBER=$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER and number(str:CUSTOMER_ID)=$ProcessedApplyReceipt/rec:CUST_ACCOUNT_ID and number(str:ORGANIZATION_ID)=$ProcessedApplyReceipt/rec:ORGANIZATION_ID]))
                    then               
                    <rec:ErrorDetail>
                    
                                <rec:DataValue>{fn:concat('APP{',$ProcessedApplyReceipt/rec:TRANSACTION_NUMBER,'} - REC{',$ProcessedApplyReceipt/rec:RECEIPT_NUMBER,'}')}</rec:DataValue>
                                <rec:ErrorMessage>{$v_MsjNoExist}</rec:ErrorMessage>
                           </rec:ErrorDetail>
                           else()
                    )
                        
                        }
                    </rec:ErrorsDetails>
                </rec:GetHtmlControlRq>
              
            </rec:ReceiptApplyRq>
};

local:funcXqtrs_validateapplys($varInvokeWsReceiptBizDigitalStampReceiptsRs.DigitalStampReceiptsRs, $verTrxsReceiptApply)
