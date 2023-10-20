xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace sft="http://soa.estrellaroja.com.mx/SFTPEstrellaRojaEnt";
(:: import schema at "../Schemas/SFTPEstrellaRojaEnt.xsd" ::)
declare namespace sta="http://soa.estrellaroja.com.mx/SFTPEstrellaRojaEnt/StatementsBankBanorte";
(:: import schema at "../Schemas/Banks/StatementsBankBanorte.xsd" ::)


declare variable $inputVariable.payload as element() (:: schema-element(sta:StatementsBankBanorte) ::) external;


declare function local:funcTrbpelstatementsaccountbanorte_to_tokenizexqy($inputVariable.payload as element() (:: schema-element(sta:StatementsBankBanorte) ::)) as element() (:: schema-element(sft:StatamentsAccountBanorteTokenize) ::) {
    
    <sft:StatamentsAccountBanorteTokenize>
         {
          
          for $Statements in $inputVariable.payload/sta:Statements
          return 
            <sft:StatamentsBanorte>
             {
                for $token at $pos in tokenize(fn:data($Statements),"[|]")
                
                return
                  if($pos eq 6) then
                    <sft:Token>{concat("N",fn:data($token))}</sft:Token>
                  else
                    <sft:Token>{fn:data($token)}</sft:Token>
              }
            </sft:StatamentsBanorte>
         }
    </sft:StatamentsAccountBanorteTokenize>
};

local:funcTrbpelstatementsaccountbanorte_to_tokenizexqy($inputVariable.payload)
