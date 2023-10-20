xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace sft1="http://soa.estrellaroja.com.mx/SFTPEstrellaRojaBiz";
(:: import schema at "oramds:/apps/SOA/SFTPEstrellaRojaBiz/SFTPEstrellaRojaBiz.xsd" ::)
declare namespace sft="http://soa.estrellaroja.com.mx/SFTPEstrellaRojaEnt";
(:: import schema at "../Schemas/SFTPEstrellaRojaEnt.xsd" ::)
declare namespace str="http://soa.estrellaroja.com.mx/StructureCodeBank";
(:: import schema at "../Schemas/StructureBankCode.xsd" ::)

declare variable $inputVariable.payload as element() (:: schema-element(sft:AccountStatementBanamexRq) ::) external;
declare variable $varStructureCodeBank as element() (:: schema-element(str:DATA_DS) ::) external;

declare function local:funcTrbpelbanamex_to_wsgetstatements($inputVariable.payload as element() (:: schema-element(sft:AccountStatementBanamexRq) ::), 
                                                            $varStructureCodeBank as element() (:: schema-element(str:DATA_DS) ::)) 
                                                            as element() (:: schema-element(sft1:GetBankStatementsRq) ::) {
    <sft1:GetBankStatementsRq>
        <sft1:BankName></sft1:BankName>
        <sft1:Sufix></sft1:Sufix>
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
                for $Line in $inputVariable.payload/sft:Lines/sft:Line
                let $varImport:=$Line/sft:Amount
                let $varAmountType:=$Line/sft:TypeTransaction
                let $ReportCodes:=local:getReportTrxType($varStructureCodeBank,$Line/sft:BanamexCode)
                return 
                <sft1:AccountStatementsLists>
                    <sft1:AccountNumber>{fn:data($inputVariable.payload/sft:AccountNumber)}</sft1:AccountNumber>
                    <sft1:StatementDate>{fn:data($inputVariable.payload/sft:RequestDate)}</sft1:StatementDate>
                    <sft1:BankCode>{fn:data($Line/sft:BanamexCode)}</sft1:BankCode>
                    <sft1:TransactionType>{fn:data($ReportCodes/str:XXER_CE_CODIGO_BANCARIO[1]/str:TRX_TYPE)}</sft1:TransactionType>
                    {
                    
                        if(contains($Line/sft:TypeTransaction, 'A')) then
                            <sft1:TypeSign>{'-'}</sft1:TypeSign>
                        else
                            <sft1:TypeSign>{'+'}</sft1:TypeSign>
                    }
                    <sft1:Amount>{fn:data($Line/sft:Amount)}</sft1:Amount>
                    <sft1:Balance></sft1:Balance>
                    <sft1:References>{fn:data($Line/sft:ReferenceNumber)}</sft1:References>
                    
                </sft1:AccountStatementsLists>
            }
        </sft1:BankLinesDetails>
    </sft1:GetBankStatementsRq>
};

declare function local:getReportTrxType($varStructureCodeBank as element() (:: schema-element(str:DATA_DS) ::), 
                                        $pTrxCode as xs:string) 
                                        as element() (:: schema-element(str:DATA_DS) ::) {
   <str:DATA_DS>
        {
            for $XXER_CE_CODIGO_BANCARIO in $varStructureCodeBank/str:XXER_CE_CODIGO_BANCARIO
            where $XXER_CE_CODIGO_BANCARIO/str:TRX_CODE=$pTrxCode
            return 
            <str:XXER_CE_CODIGO_BANCARIO>
                <str:TRX_TYPE>{fn:data($XXER_CE_CODIGO_BANCARIO/str:TRX_TYPE)}</str:TRX_TYPE>
                <str:TRX_CODE>{fn:data($XXER_CE_CODIGO_BANCARIO/str:TRX_CODE)}</str:TRX_CODE>
            </str:XXER_CE_CODIGO_BANCARIO>
        }
    </str:DATA_DS>
};
local:funcTrbpelbanamex_to_wsgetstatements($inputVariable.payload, $varStructureCodeBank)
