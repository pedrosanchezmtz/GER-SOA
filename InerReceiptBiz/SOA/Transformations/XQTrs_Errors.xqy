xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace rec="http://soa.estrellaroja.com.mx/ReceiptBiz";
(:: import schema at "oramds:/apps/SOA/INER_ReceiptBiz/ReceiptBiz.xsd" ::)
declare namespace soa="http://soa.estrellaroja.com.mx/SOAUtilitiesTec";
(:: import schema at "oramds:/apps/SOA/SOAUtilitiesTec/SOAUtilitiesTec.xsd" ::)

declare variable $inputVariable.ReceiptApplyRq as element() (:: schema-element(rec:ReceiptApplyRq) ::) external;
declare variable $varHtmlInput.GetHtmlControlRq as element() (:: schema-element(soa:GetHtmlControlRq) ::) external;

declare function local:funcXqtrs_errors($inputVariable.ReceiptApplyRq as element() (:: schema-element(rec:ReceiptApplyRq) ::), 
                                        $varHtmlInput.GetHtmlControlRq as element() (:: schema-element(soa:GetHtmlControlRq) ::)) 
                                        as element() (:: schema-element(soa:GetHtmlControlRq) ::) {
    <soa:GetHtmlControlRq>
        {
            if (fn:string-length($varHtmlInput.GetHtmlControlRq/soa:TotalSucceeded/text())>0)
            then <soa:TotalSucceeded>{fn:data($varHtmlInput.GetHtmlControlRq/soa:TotalSucceeded)}</soa:TotalSucceeded>
            else 
            <soa:TotalSucceeded>0</soa:TotalSucceeded>
            
        }
        {
            if (fn:string-length($varHtmlInput.GetHtmlControlRq/soa:TotalErrors/text())>0)
            then <soa:TotalErrors>{fn:data($varHtmlInput.GetHtmlControlRq/soa:TotalErrors)}</soa:TotalErrors>
            else <soa:TotalErrors>0</soa:TotalErrors>
        }
        <soa:TotalProcessed>{fn:data($varHtmlInput.GetHtmlControlRq/soa:TotalProcessed)}</soa:TotalProcessed>
        <soa:ErrorsDetails>
             {
             if (count($varHtmlInput.GetHtmlControlRq/soa:ErrorsDetails/soa:ErrorDetail)>0)
            then
                        for $ErrorDetail in $varHtmlInput.GetHtmlControlRq/soa:ErrorsDetails/soa:ErrorDetail
                        return 
                        <soa:ErrorDetail>
                            <soa:DataValue>{fn:data($ErrorDetail/soa:DataValue)}</soa:DataValue>
                            <soa:ErrorMessage>{fn:data($ErrorDetail/soa:ErrorMessage)}</soa:ErrorMessage>
                        </soa:ErrorDetail>
                        else()
                    }
					 {
          if (count($inputVariable.ReceiptApplyRq/rec:GetHtmlControlRq/rec:ErrorsDetails/rec:ErrorDetail)>0)
            then
                for $ErrorDetail in $inputVariable.ReceiptApplyRq/rec:GetHtmlControlRq/rec:ErrorsDetails/rec:ErrorDetail
                return 
                <soa:ErrorDetail>
                    <soa:DataValue>{fn:data($ErrorDetail/rec:DataValue)}</soa:DataValue>
                    <soa:ErrorMessage>{fn:data($ErrorDetail/rec:ErrorMessage)}</soa:ErrorMessage>
                    </soa:ErrorDetail>
                    else()
            }</soa:ErrorsDetails>
    </soa:GetHtmlControlRq>
};

local:funcXqtrs_errors($inputVariable.ReceiptApplyRq, $varHtmlInput.GetHtmlControlRq)
