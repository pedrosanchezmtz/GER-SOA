<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ns0="http://soa.estrellaroja.com.mx/InvoicesBiz/StructursInvoicesBiz" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns2="http://soa.estrellaroja.com.mx/InvoicesBiz" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 ns2 mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:client="http://soa.estrellaroja.com.mx/InvoicesBiz/bpelBuildInvoicesZip"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns5="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:ns3="http://soa.estrellaroja.com.mx/SOAUtilitiesTec"
                xmlns:ns1="http://schemas.oracle.com/bpel/extension" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns6="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec"
                xmlns:ns4="http://soa.estrellaroja.com.mx/FinancialsTec"
                xmlns:ns7="http://soa.estrellaroja.com.mx/InvoicesBiz/ERPIntegrationServiceTec">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/bpelBuildInvoicesZip.wsdl"/>
            <oracle-xsl-mapper:rootElement name="ListZipFiles" namespace="http://soa.estrellaroja.com.mx/InvoicesBiz/StructursInvoicesBiz"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/bpelBuildInvoicesZip.wsdl"/>
            <oracle-xsl-mapper:rootElement name="ListBUsAndOrgId" namespace="http://soa.estrellaroja.com.mx/InvoicesBiz/StructursInvoicesBiz"/>
            <oracle-xsl-mapper:param name="varListUniquesBUs"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/bpelBuildInvoicesZip.wsdl"/>
            <oracle-xsl-mapper:rootElement name="ListTrxNumber" namespace="http://soa.estrellaroja.com.mx/InvoicesBiz"/>
            <oracle-xsl-mapper:param name="varTrxNumberInProcess"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/bpelBuildInvoicesZip.wsdl"/>
            <oracle-xsl-mapper:rootElement name="BuildInvoicesZipRs" namespace="http://soa.estrellaroja.com.mx/InvoicesBiz"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [TUE MAR 13 08:06:48 CST 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="varListUniquesBUs"/>
   <xsl:param name="varTrxNumberInProcess"/>
   <xsl:template match="/">
      <ns2:BuildInvoicesZipRs>
         <ns2:Return>
            <ns2:ListOutPutBuildInvoices>
               <xsl:for-each select="$varTrxNumberInProcess/ns2:ListTrxNumber/ns2:TrxNumberInProcess/ns2:ListTrxNumber">
                  <ns2:ListTrxNumber>
                     <ns2:Trx_Number>
                        <xsl:value-of select="ns2:Trx_Number"/>
                     </ns2:Trx_Number>
                  </ns2:ListTrxNumber>
               </xsl:for-each>
               <ns2:BatchId>
                  <xsl:value-of select="$varTrxNumberInProcess/ns2:ListTrxNumber/ns2:TrxNumberInProcess/ns2:BatchId"/>
               </ns2:BatchId>
               <xsl:for-each select="/ns0:ListZipFiles/ns0:List">
                  <ns2:ListZipFile>
                     <ns2:ContentBase64>
                        <xsl:value-of select="ns0:ContentBase64"/>
                     </ns2:ContentBase64>
                  </ns2:ListZipFile>
               </xsl:for-each>
               <xsl:for-each select="$varListUniquesBUs/ns0:ListBUsAndOrgId/ns0:return">
                  <ns2:ListUniqueBus>
                     <ns2:BusinessUnidName>
                        <xsl:value-of select="ns0:BuName"/>
                     </ns2:BusinessUnidName>
                     <ns2:OrganizationId>
                        <xsl:value-of select="ns0:OrgId"/>
                     </ns2:OrganizationId>
                  </ns2:ListUniqueBus>
               </xsl:for-each>
            </ns2:ListOutPutBuildInvoices>
         </ns2:Return>
      </ns2:BuildInvoicesZipRs>
   </xsl:template>
</xsl:stylesheet>