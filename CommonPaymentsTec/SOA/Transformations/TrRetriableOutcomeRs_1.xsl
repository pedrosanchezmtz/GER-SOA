<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/dbGetRetriableOutcome" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:tns="http://soa.estrellaroja.com.mx/CommonPaymentsTec" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/db/CommonPaymentsTec/CommonPaymentsTec/dbGetRetriableOutcome"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:cmn="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:client="http://soa.estrellaroja.com/CommonPaymentsTec/bpelGetRetriableOutcome">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/dbGetRetriableOutcome.wsdl"/>
            <oracle-xsl-mapper:rootElement name="dbGetRetriableOutcomeOutputCollection" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/dbGetRetriableOutcome"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/bpelGetRetriableOutcome.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetRetriableOutcomeRs" namespace="http://soa.estrellaroja.com.mx/CommonPaymentsTec"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [THU DEC 07 16:22:43 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:GetRetriableOutcomeRs>
         <cmn:Success/>
         <tns:Return>
            <xsl:for-each select="/ns0:dbGetRetriableOutcomeOutputCollection/ns0:dbGetRetriableOutcomeOutput">
               <tns:RetriableOutcome>
                  <tns:PaymentId>
                     <xsl:value-of select="ns0:PAYMENT_ID"/>
                  </tns:PaymentId>
                  <tns:receivable_application_id>
                     <xsl:value-of select="ns0:receivable_application_id"/>
                  </tns:receivable_application_id>
                  <tns:PlainContent>
                     <xsl:value-of select="ns0:CONTENT"/>
                  </tns:PlainContent>
               </tns:RetriableOutcome>
            </xsl:for-each>
         </tns:Return>
      </tns:GetRetriableOutcomeRs>
   </xsl:template>
</xsl:stylesheet>