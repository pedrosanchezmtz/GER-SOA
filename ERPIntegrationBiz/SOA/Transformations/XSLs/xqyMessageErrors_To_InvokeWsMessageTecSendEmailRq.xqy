xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace erp="http://soa.estrellaroja.com.mx/ERPIntegrationBiz";
(:: import schema at "oramds:/apps/SOA/ERPIntegrationBiz/ERPIntegrationBiz.xsd" ::)
declare namespace mes="http://soa.estrellaroja.com.mx/MessageTec";
(:: import schema at "oramds:/apps/SOA/MessageTec/MessageTec.xsd" ::)

declare variable $outputVariable.payload as element() (:: schema-element(erp:ImportToERPCloudRs) ::) external;

declare function local:funcXqymessageerrors_to_invokewsmessagetecsendemailrq($outputVariable.payload as element() (:: schema-element(erp:ImportToERPCloudRs) ::)) as element() (:: schema-element(mes:MessageRq) ::) {
    <mes:MessageRq>
        <mes:Message>
            <mes:Addresses>
                <mes:AddressTo></mes:AddressTo>
                <mes:AddressCC></mes:AddressCC>
            </mes:Addresses>
            <mes:Subject></mes:Subject>
            <mes:Message>{
            let $varMessage :=
            for $varProcess in $outputVariable.payload/erp:Return/erp:Processes/erp:Process
                return
                fn:concat($varProcess/erp:ProcessName,' ',$varProcess/erp:Status,'<br/>')
            return $varMessage   
            }</mes:Message>
        </mes:Message>
    </mes:MessageRq>
};

local:funcXqymessageerrors_to_invokewsmessagetecsendemailrq($outputVariable.payload)
