xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace typ="http://soa.estrellaroja.com.mx/LetterPorteBiz";
(:: import schema at "oramds:/apps/SOA/LetterPorteBiz/LetterPorteBiz.xsd" ::)
declare namespace xxe="http://soa.estrellaroja.com.mx/LetterPorteBiz/Reports/XXER_AR_INVOICES_TRX";
(:: import schema at "../Schemas/Reports/XXER_AR_INVOICES_TRX.xsd" ::)

declare variable $v_transactions as element() (:: schema-element(xxe:DATA_DS) ::) external;

declare function local:funcXqtrs_input($v_transactions as element() (:: schema-element(xxe:DATA_DS) ::)) as element() (:: schema-element(typ:GenerateURLRelationCFDIsRq) ::) {
    <typ:GenerateURLRelationCFDIsRq>
        {
            for $G_1 in $v_transactions/xxe:G_1
            return 
            <typ:Transactions>
                <typ:TransactionNumber>{fn:data($G_1/xxe:TRANSACTION_NUMBER)}</typ:TransactionNumber>
                <typ:CustomerTrxID>{fn:data($G_1/xxe:CUSTOMER_TRX_ID)}</typ:CustomerTrxID>
                <typ:BusinessUnit>{fn:data($G_1/xxe:BUSINESS_UNIT)}</typ:BusinessUnit>
                <typ:TransactionSource>{fn:data($G_1/xxe:TRANSACTION_SOURCE)}</typ:TransactionSource>
                </typ:Transactions>
        }
    </typ:GenerateURLRelationCFDIsRq>
};

local:funcXqtrs_input($v_transactions)
