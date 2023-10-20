xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace sft1="http://soa.estrellaroja.com.mx/SFTPEstrellaRojaBiz";
(:: import schema at "oramds:/apps/SOA/SFTPEstrellaRojaBiz/SFTPEstrellaRojaBiz.xsd" ::)
declare namespace sft="http://soa.estrellaroja.com.mx/SFTPEstrellaRojaEnt";
(:: import schema at "../Schemas/SFTPEstrellaRojaEnt.xsd" ::)
declare namespace str="http://soa.estrellaroja.com.mx/StructureCodeBank";
(:: import schema at "../Schemas/StructureBankCode.xsd" ::)

declare variable $varStructureCodeBank as element() (:: schema-element(str:DATA_DS) ::) external;
declare variable $varStatementsBanorteTokenieze as element() (:: schema-element(sft:StatamentsAccountBanorteTokenize) ::) external;

declare function local:funcTrbpelbanorte_to_wsgetstatements($varStructureCodeBank as element() (:: schema-element(str:DATA_DS) ::), 
                                                            $varStatementsBanorteTokenieze as element() (:: schema-element(sft:StatamentsAccountBanorteTokenize) ::)) 
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
                for $StatamentsBanorte in $varStatementsBanorteTokenieze/sft:StatamentsBanorte
                let $varImport:=translate(translate(fn:data($StatamentsBanorte/sft:Token[8]),'$',''),',','')
                let $varCharger:=translate(translate(fn:data($StatamentsBanorte/sft:Token[9]),'$',''),',','')
                let $varBalance:=translate(translate(fn:data($StatamentsBanorte/sft:Token[10]),'$',''),',','')
                let $ReportCodes:=local:getReportTrxType($varStructureCodeBank,$StatamentsBanorte/sft:Token[6])
                return 
                <sft1:AccountStatementsLists>
                    
                    <sft1:AccountNumber>{fn:data($StatamentsBanorte/sft:Token[1])}</sft1:AccountNumber>
                    <sft1:StatementDate>{fn:data($StatamentsBanorte/sft:Token[2])}</sft1:StatementDate>
                    <sft1:BankCode>{fn:data($StatamentsBanorte/sft:Token[6])}</sft1:BankCode>
                    <sft1:TransactionType>{fn:data($ReportCodes/str:XXER_CE_CODIGO_BANCARIO[1]/str:TRX_TYPE)}</sft1:TransactionType>
                     {
                    
                        if(number($varImport) gt 0) then
                            <sft1:TypeSign>{'-'}</sft1:TypeSign>
                        else
                            <sft1:TypeSign>{'+'}</sft1:TypeSign>
                    }
                    {
                        if(number($varImport) gt 0) then
                            <sft1:Amount>{$varImport}</sft1:Amount>
                        else 
                         <sft1:Amount>{$varCharger}</sft1:Amount>
                    }
                    <sft1:Balance>{$varBalance}</sft1:Balance>
                    <sft1:References>{fn:data($StatamentsBanorte/sft:Token[4])}</sft1:References>
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

local:funcTrbpelbanorte_to_wsgetstatements($varStructureCodeBank, $varStatementsBanorteTokenieze)
