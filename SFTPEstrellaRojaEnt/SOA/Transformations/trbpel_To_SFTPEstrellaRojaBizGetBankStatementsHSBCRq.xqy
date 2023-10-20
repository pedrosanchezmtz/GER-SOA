xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace sft="http://soa.estrellaroja.com.mx/SFTPEstrellaRojaBiz";
(:: import schema at "oramds:/apps/SOA/SFTPEstrellaRojaBiz/SFTPEstrellaRojaBiz.xsd" ::)
declare namespace sta="http://soa.estrellaroja.com.mx/SFTPEstrellaRojaEnt/StatementsBankHSBC";
(:: import schema at "../Schemas/Banks/StatementsBankHSBC.xsd" ::)
declare namespace str="http://soa.estrellaroja.com.mx/StructureCodeBank";
(:: import schema at "../Schemas/StructureBankCode.xsd" ::)

declare variable $varDataCodeReport as element() (:: schema-element(str:DATA_DS) ::) external;
declare variable $inputVariable.payload as element() (:: schema-element(sta:StatementsBankHSBC) ::) external;

declare function local:funcTrbpel_to_sftpestrellarojabizgetbankstatementshsbcrq($varDataCodeReport as element() (:: schema-element(str:DATA_DS) ::), 
                                                                                $inputVariable.payload as element() (:: schema-element(sta:StatementsBankHSBC) ::)) 
                                                                                as element() (:: schema-element(sft:GetBankStatementsRq) ::) {
     <sft:GetBankStatementsRq>
          <sft:BankName></sft:BankName>
          <sft:Sufix></sft:Sufix>
          <sft:BankBranch></sft:BankBranch>
          <sft:BanchId></sft:BanchId>
          <sft:Balances>
              <sft:Balance>
                  <sft:AccountNumber></sft:AccountNumber>
                  <sft:StatementCode></sft:StatementCode>
                  <sft:Balance></sft:Balance>
                  <sft:CurrencyCode></sft:CurrencyCode>
                  <sft:Indicator></sft:Indicator>
                  <sft:BalanceDate></sft:BalanceDate>
                  <sft:OrigBalanceCode></sft:OrigBalanceCode>
              </sft:Balance>
          </sft:Balances>
        <sft:BankLinesDetails>
         {
         
          for $StatamentsHSBC in $inputVariable.payload/sta:StatementsLine
          
          let $ReportCodes:=local:getReportTrxType($varDataCodeReport,string($StatamentsHSBC/sta:ReferenciaBanco)) 
          let $Banlance:=fn:translate(fn:data($inputVariable.payload/sta:StatementsLine[last()]/sta:Saldo),',','')

            return 
 
            <sft:AccountStatementsLists>              
                <sft:AccountNumber>{$StatamentsHSBC/sta:NumeroCuenta}</sft:AccountNumber>
                <sft:StatementDate>{fn:data($StatamentsHSBC/sta:FechaValor)}</sft:StatementDate>
                <sft:BankCode>{fn:data($StatamentsHSBC/sta:ReferenciaBanco)}</sft:BankCode>
                <sft:TransactionType>{fn:data($ReportCodes/str:XXER_CE_CODIGO_BANCARIO[1]/str:TRX_TYPE)}</sft:TransactionType>
                    {
                    if(fn:data($StatamentsHSBC/sta:ImporteCredito)!='0') then
                        <sft:TypeSign>{'-'}</sft:TypeSign>
                        
                    else
                        <sft:TypeSign>{'+'}</sft:TypeSign>
                    }
                    {
                    if(fn:data($StatamentsHSBC/sta:ImporteCredito)!='0') then
                        <sft:Amount>{fn:translate(fn:data($StatamentsHSBC/sta:ImporteCredito),',','')}</sft:Amount>
                        
                    else
                        <sft:Amount>{fn:translate(fn:translate(fn:data($StatamentsHSBC/sta:ImporteDebito),',',''),'-','')}</sft:Amount>
                    }
                <sft:References>{fn:data($StatamentsHSBC/sta:Descripcion)}</sft:References>
            </sft:AccountStatementsLists>
          }  
        </sft:BankLinesDetails>
    </sft:GetBankStatementsRq>
};
declare function local:getReportTrxType($varDataCodeReport as element() (:: schema-element(str:DATA_DS) ::), 
                                        $pTrxCode as xs:string) 
                                        as element() (:: schema-element(str:DATA_DS) ::) {
   <str:DATA_DS>
        {
            for $XXER_CE_CODIGO_BANCARIO in $varDataCodeReport/str:XXER_CE_CODIGO_BANCARIO
            where $XXER_CE_CODIGO_BANCARIO/str:TRX_CODE=$pTrxCode
            return 
            <str:XXER_CE_CODIGO_BANCARIO>
                <str:TRX_TYPE>{fn:data($XXER_CE_CODIGO_BANCARIO/str:TRX_TYPE)}</str:TRX_TYPE>
                <str:TRX_CODE>{fn:data($XXER_CE_CODIGO_BANCARIO/str:TRX_CODE)}</str:TRX_CODE>
            </str:XXER_CE_CODIGO_BANCARIO>
        }
    </str:DATA_DS>
};

local:funcTrbpel_to_sftpestrellarojabizgetbankstatementshsbcrq($varDataCodeReport, $inputVariable.payload)
