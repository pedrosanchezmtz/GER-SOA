<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:tns="http://soa.estrellaroja.com.mx/SOAUtilitiesTec" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://soa.estrellaroja.com.mx/InvoicesBiz" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns1="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:ns2="http://schemas.oracle.com/bpel/extension" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns3="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec"
                xmlns:client="http://soa.estrellaroja.com.mx/InvoicesBiz/bpelUpdateUuid"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:ns4="http://soa.estrellaroja.com.mx/SOAUtilitiesTec/types"
                xmlns:ns5="http://soa.estrellaroja.com.mx/MessageTec"
                xmlns:ns6="http://soa.estrellaroja.com.mx/InvoicesBiz/ERPIntegrationServiceTec">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/bpelUpdateUuid.wsdl"/>
            <oracle-xsl-mapper:rootElement name="ErrorDetailsHelper" namespace="http://soa.estrellaroja.com.mx/InvoicesBiz"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/bpelUpdateUuid.wsdl"/>
            <oracle-xsl-mapper:rootElement name="TotalUuIdsUpdated" namespace="http://soa.estrellaroja.com.mx/InvoicesBiz"/>
            <oracle-xsl-mapper:param name="varTotalUpdUuId"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="oramds:/apps/SOA/SOAUtilitiesTec/SOAUtilitiesTec.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetHtmlControlRq" namespace="http://soa.estrellaroja.com.mx/SOAUtilitiesTec"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [TUE JAN 30 12:27:47 CST 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="varTotalUpdUuId"/>
   <xsl:template match="/">
      <tns:GetHtmlControlRq>
         <tns:TotalSucceeded>
            <xsl:value-of select="$varTotalUpdUuId/ns0:TotalUuIdsUpdated/ns0:ResultList/ns0:TotalSucceeded"/>
         </tns:TotalSucceeded>
         <tns:TotalErrors>
            <xsl:value-of select="$varTotalUpdUuId/ns0:TotalUuIdsUpdated/ns0:ResultList/ns0:TotalErrors"/>
         </tns:TotalErrors>
         <tns:TotalProcessed>
            <xsl:value-of select="$varTotalUpdUuId/ns0:TotalUuIdsUpdated/ns0:ResultList/ns0:TotalProcessed"/>
         </tns:TotalProcessed>
         <tns:ErrorsDetails>
            <xsl:for-each select="/ns0:ErrorDetailsHelper/ns0:ErrorDetail">
               <tns:ErrorDetail>
                  <tns:DataValue>
                     <xsl:value-of select="ns0:DataValue"/>
                  </tns:DataValue>
                  <tns:ErrorMessage>
                     <xsl:value-of select="ns0:ErrorMessage"/>
                  </tns:ErrorMessage>
               </tns:ErrorDetail>
            </xsl:for-each>
         </tns:ErrorsDetails>
      </tns:GetHtmlControlRq>
   </xsl:template>
</xsl:stylesheet>