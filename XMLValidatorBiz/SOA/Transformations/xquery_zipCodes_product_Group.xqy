xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://soa.estrellaroja.com.mx/Tables/XXER_CONF_VALIDADOR_XML_TBL";
(:: import schema at "oramds:/apps/Common/Tables/XXER_CONF_VALIDADOR_XML_TBL.xsd" ::)
declare namespace ns1="http://soa.estrellaroja.com.mx/XMLValidatorBiz";
(:: import schema at "oramds:/apps/SOA/XMLValidatorBiz/XMLValidatorBiz.xsd" ::)
declare namespace car = "http://soa.estrellaroja.com.mx/CartaPorte";


declare variable $input as element() (:: schema-element(ns1:ValidaCartaPorteRq) ::) external;

declare function local:func($input as element() (:: schema-element(ns1:ValidaCartaPorteRq) ::)) as element() (:: schema-element(ns2:ConsultaZAM) ::) {
    <ns2:ConsultaZAM>
        <ns2:ZipCodes>{
        
              let $zipsCodes:= fn:distinct-values($input/car:CartaPorte/car:trasladoMercancias/car:Remolque/car:Traslados/car:Traslado/car:DireccionDestino/car:CodigoPostal)
                    for $item in $zipsCodes
                    return 
            <ns2:ZipCode>
                <ns2:ZipCode>{$item}</ns2:ZipCode>
            </ns2:ZipCode>
            }
            {
        
              let $zipsCodes2:= fn:distinct-values($input/car:CartaPorte/car:trasladoMercancias/car:Remolque/car:Traslados/car:Traslado/car:DireccionOrigen/car:CodigoPostal)
                    for $item2 in $zipsCodes2
                    return 
            <ns2:ZipCode>
                <ns2:ZipCode>{$item2}</ns2:ZipCode>
            </ns2:ZipCode>
            }
        </ns2:ZipCodes>
        <ns2:Products>
        {
        let $mercancias:= fn:distinct-values($input/car:CartaPorte/car:trasladoMercancias/car:Remolque/car:Traslados/car:Traslado/car:Mercancias/car:Mercancia/car:BienesTransp)
                    for $item in $mercancias
                    return 
                    <ns2:Product>
                <ns2:Product>{$item}</ns2:Product>
            </ns2:Product>
        }
            
        </ns2:Products>
    </ns2:ConsultaZAM>
};

local:func($input)
