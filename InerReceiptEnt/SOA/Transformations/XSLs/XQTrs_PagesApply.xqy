xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace rec="http://soa.estrellaroja.com.mx/ReceiptBiz";
(:: import schema at "oramds:/apps/SOA/INER_ReceiptBiz/ReceiptBiz.xsd" ::)
declare namespace str="http://soa.estrellaroja.com.mx/StructureTrxCust";
(:: import schema at "../../Schemas/StructureTrxCust.xsd" ::)

declare variable $varInvokeWsReceiptBizDigitalStampReceiptsRs.DigitalStampReceiptsRs as element() (:: schema-element(rec:DigitalStampReceiptsRs) ::) external;
declare variable $numGroup as xs:string external;
declare variable $regNum:= fn:count($varInvokeWsReceiptBizDigitalStampReceiptsRs.DigitalStampReceiptsRs/rec:Return/rec:Data/rec:ProcessedApplyReceipt);
declare variable $groups:=fn:ceiling(($regNum div xs:integer($numGroup)));
declare function local:funcXqtrs_pagesapply($varInvokeWsReceiptBizDigitalStampReceiptsRs.DigitalStampReceiptsRs as element() (:: schema-element(rec:DigitalStampReceiptsRs) ::)) as element() (:: schema-element(str:TrxsElement) ::) {
   <str:TrxsElement>{
    
    for $group in 0 to xs:integer($groups)-1

    return 
            <str:Element>
                {
                    for $ProcessedApplyReceipt in $varInvokeWsReceiptBizDigitalStampReceiptsRs.DigitalStampReceiptsRs/rec:Return/rec:Data/rec:ProcessedApplyReceipt[position() mod xs:integer($groups)eq $group ]
                    return 
                    <str:Trx>
                        <str:TRANSACTION_NUMBER>{fn:data($ProcessedApplyReceipt/rec:TRANSACTION_NUMBER)}</str:TRANSACTION_NUMBER>
                        </str:Trx>
                }

        </str:Element>
   } </str:TrxsElement>
};

local:funcXqtrs_pagesapply($varInvokeWsReceiptBizDigitalStampReceiptsRs.DigitalStampReceiptsRs)
