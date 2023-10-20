xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace sft1="http://soa.estrellaroja.com.mx/SFTPEstrellaRojaBiz";
(:: import schema at "oramds:/apps/SOA/SFTPEstrellaRojaBiz/SFTPEstrellaRojaBiz.xsd" ::)
declare namespace sft="http://soa.estrellaroja.com.mx/SFTPEstrellaRojaEnt";
(:: import schema at "../Schemas/SFTPEstrellaRojaEnt.xsd" ::)
declare namespace str="http://soa.estrellaroja.com.mx/StructureCodeBank";
(:: import schema at "../Schemas/StructureBankCode.xsd" ::)

declare variable $varXmlReport as element() (:: schema-element(str:DATA_DS) ::) external;
declare variable $varSegmentLine as element() (:: schema-element(sft:AccountStatementSantander) ::) external;

declare function local:funcTrbpel_to_sftpestrellarojabizgetbankstatementsrq($varXmlReport as element() (:: schema-element(str:DATA_DS) ::), 
                                                                            $varSegmentLine as element() (:: schema-element(sft:AccountStatementSantander) ::)) 
                                                                            as element() (:: schema-element(sft1:GetBankStatementsRq) ::) {
    <sft1:GetBankStatementsRq>
        <sft1:BankName></sft1:BankName>
        <sft1:BankBranch></sft1:BankBranch>
        <sft1:BanchId></sft1:BanchId>
        <sft1:Balances>
            <sft1:Balance>
                <sft1:AccountNumber></sft1:AccountNumber>
                <sft1:StatementCode></sft1:StatementCode>
                <sft1:Balance></sft1:Balance>
                <sft1:CurrencyCode></sft1:CurrencyCode>
                <sft1:Indicator></sft1:Indicator>
                <sft1:BalanceDate></sft1:BalanceDate>
                <sft1:OrigBalanceCode></sft1:OrigBalanceCode>
            </sft1:Balance>
        </sft1:Balances>
        <sft1:BankLinesDetails>
            {
                for $Transactions in $varSegmentLine/sft:Transactions
                let $ReportCodes:=local:getReportTrxType($varXmlReport,$Transactions/sft:BankCode)
                return 
                <sft1:AccountStatementsLists>
                    
                    <sft1:AccountNumber>{fn:data($Transactions/sft:AccountNumber)}</sft1:AccountNumber>
                    <sft1:StatementDate>{fn:data($Transactions/sft:StatementDate)}</sft1:StatementDate>
                    <sft1:BankCode>{fn:data($Transactions/sft:BankCode)}</sft1:BankCode>
                    <sft1:TransactionType>{fn:data($ReportCodes/str:XXER_CE_CODIGO_BANCARIO[1]/str:TRX_TYPE)}</sft1:TransactionType>
                    {
                        if (contains($Transactions/sft:SignType,'-')) then
                            <sft1:TypeSign>{"+"}</sft1:TypeSign>
                        else
                            <sft1:TypeSign>{"-"}</sft1:TypeSign>
                    }
                    <sft1:Amount>{fn:data($Transactions/sft:Amount)}</sft1:Amount>
                    <sft1:Balance>{fn:data($Transactions/sft:Balance)}</sft1:Balance>
                    <sft1:References>{fn:data($Transactions/sft:Reference)}</sft1:References>
                </sft1:AccountStatementsLists>
            }
        </sft1:BankLinesDetails>
    </sft1:GetBankStatementsRq>
};

declare function local:getReportTrxType($XmlIn as element() (:: schema-element(str:DATA_DS) ::), 
                                        $pTrxCode as xs:string) 
                                        as element() (:: schema-element(str:DATA_DS) ::) {
    <str:DATA_DS>
        {
            for $XXER_CE_CODIGO_BANCARIO in $XmlIn/str:XXER_CE_CODIGO_BANCARIO
            where $XXER_CE_CODIGO_BANCARIO/str:TRX_CODE=$pTrxCode
            return 
            <str:XXER_CE_CODIGO_BANCARIO>
                <str:TRX_TYPE>{fn:data($XXER_CE_CODIGO_BANCARIO/str:TRX_TYPE)}</str:TRX_TYPE>
                <str:TRX_CODE>{fn:data($XXER_CE_CODIGO_BANCARIO/str:TRX_CODE)}</str:TRX_CODE>
            </str:XXER_CE_CODIGO_BANCARIO>
        }
    </str:DATA_DS>
};



local:funcTrbpel_to_sftpestrellarojabizgetbankstatementsrq($varXmlReport, $varSegmentLine)
