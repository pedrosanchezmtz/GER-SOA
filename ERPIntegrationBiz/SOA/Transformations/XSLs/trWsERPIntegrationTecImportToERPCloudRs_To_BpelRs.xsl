<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:ns0="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec" xmlns:tns="http://soa.estrellaroja.com.mx/ERPIntegrationBiz" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xmlns:ns1="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:ns2="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec/types" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns3="http://schemas.oracle.com/bpel/extension" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:client="http://soa.estrellaroja.com.mx/ERPIntegrationBiz/bpelImportToERPCloud" xmlns:ns4="http://soa.estrellaroja.com.mx/ERPIntegrationBiz/types" xmlns:ns7="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountContactRole/" xmlns:ns10="commonj.sdo/xml" xmlns:ns11="commonj.sdo/java" xmlns:ns12="http://xmlns.oracle.com/apps/cdm/foundation/parties/customerAccountService/" xmlns:ns15="http://xmlns.oracle.com/apps/financials/receivables/customers/customerProfileService/" xmlns:ns16="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/orgContact/" xmlns:ns17="http://xmlns.oracle.com/apps/cdm/foundation/parties/personService/" xmlns:ns18="http://xmlns.oracle.com/apps/cdm/foundation/parties/partyService/" xmlns:ns20="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountSiteUse/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:ns22="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountRel/" xmlns:ns30="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/sourceSystemRef/" xmlns:ns32="http://xmlns.oracle.com/apps/financials/receivables/creditManagement/creditChecking/creditCheckingService/" xmlns:ns5="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/partySite/" xmlns:ns6="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountContact/" xmlns:ns8="http://xmlns.oracle.com/adf/svc/errors/" xmlns:ns9="http://xmlns.oracle.com/adf/svc/types/" xmlns:ns13="http://xmlns.oracle.com/apps/cdm/foundation/parties/relationshipService/" xmlns:ns14="http://soa.estrellaroja.com.mx/Customers/Types" xmlns:ns19="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/relationship/" xmlns:ns21="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/person/" xmlns:ns23="http://xmlns.oracle.com/apps/financials/receivables/customerSetup/customerProfiles/model/flex/CustomerProfileGdf/" xmlns:ns24="http://xmlns.oracle.com/apps/financials/receivables/creditManagement/creditChecking/creditCheckingService/types/" xmlns:ns25="http://xmlns.oracle.com/apps/cdm/foundation/parties/contactPointService/" xmlns:ns26="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccount/" xmlns:ns27="http://xmlns.oracle.com/apps/cdm/foundation/parties/organizationService/" xmlns:ns28="commonj.sdo" xmlns:ns29="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/organization/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:ns31="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountSite/" xmlns:ns33="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/contactPoint/" xmlns:ns34="http://xmlns.oracle.com/apps/financials/receivables/customerSetup/customerProfiles/model/flex/CustomerProfileDff/" xmlns:ns35="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec/Orders">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="oramds:/apps/OSB/ERPIntegrationServiceTec/ERPIntegrationServiceTec.wsdl"/>
            <oracle-xsl-mapper:rootElement name="LoadInterfaceRs" namespace="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelImportToERPCloud.wsdl"/>
            <oracle-xsl-mapper:rootElement name="ImportToERPCloudRs" namespace="http://soa.estrellaroja.com.mx/ERPIntegrationBiz"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [THU JUL 13 16:46:51 CDT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:ImportToERPCloudRs>
         <xsl:if test="/ns0:LoadInterfaceRs/ns1:Success">
            <ns1:Success>
               <xsl:value-of select="/ns0:LoadInterfaceRs/ns1:Success"/>
            </ns1:Success>
         </xsl:if>
         <xsl:if test="/ns0:LoadInterfaceRs/ns1:Errors">
            <ns1:Errors>
               <xsl:for-each select="/ns0:LoadInterfaceRs/ns1:Errors/ns1:Error">
                  <ns1:Error>
                     <ns1:ErrorCode>
                        <xsl:value-of select="ns1:ErrorCode"/>
                     </ns1:ErrorCode>
                     <ns1:ShortDescription>
                        <xsl:value-of select="ns1:ShortDescription"/>
                     </ns1:ShortDescription>
                     <ns1:Description>
                        <xsl:value-of select="ns1:Description"/>
                     </ns1:Description>
                     <ns1:BusinessProcess>
                        <xsl:value-of select="ns1:BusinessProcess"/>
                     </ns1:BusinessProcess>
                     <ns1:FailedService>
                        <xsl:value-of select="ns1:FailedService"/>
                     </ns1:FailedService>
                     <ns1:TimeStamp>
                        <xsl:value-of select="ns1:TimeStamp"/>
                     </ns1:TimeStamp>
                  </ns1:Error>
               </xsl:for-each>
            </ns1:Errors>
         </xsl:if>
      </tns:ImportToERPCloudRs>
   </xsl:template>
</xsl:stylesheet>