<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:tns="http://soa.estrellaroja.com.mx/SOAUtilitiesTec" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:ns1="http://soa.estrellaroja.com.mx/ElectronicInvoiceAP" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://soa.estrellaroja.com.mx/InvoicesBiz" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns1 ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns3="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:client="http://soa.estrellaroja.com.mx/InvoicesBiz/bpelValidateInvoicesAP"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns2="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec"
                xmlns:ns5="http://soa.estrellaroja.com.mx/cfd/3"
                xmlns:ns4="http://soa.estrellaroja.com.mx/sitio_internet/cfd/tipoDatos/tdCFDI"
                xmlns:ns6="http://soa.estrellaroja.com.mx/TimbreFiscalDigital"
                xmlns:ns9="http://www.sat.gob.mx/ConsumoDeCombustibles11"
                xmlns:ns10="http://www.sat.gob.mx/sitio_internet/cfd/catalogos/Pagos"
                xmlns:ns11="http://www.sat.gob.mx/sitio_internet/cfd/catalogos/ComExt"
                xmlns:ns12="http://www.sat.gob.mx/sitio_internet/cfd/catalogos"
                xmlns:ns13="http://www.sat.gob.mx/TimbreFiscalDigital"
                xmlns:ns7="http://soa.estrellaroja.com.mx/InvoicesBiz/ERPIntegrationServiceTec"
                xmlns:ns14="http://www.sat.gob.mx/EstadoDeCuentaCombustible12"
                xmlns:ns15="http://www.sat.gob.mx/sitio_internet/cfd/catalogos/Nomina"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:ns8="http://www.sat.gob.mx/cfd/4"
                xmlns:ns16="http://www.sat.gob.mx/sitio_internet/cfd/catalogos/CartaPorte"
                xmlns:ns17="http://www.sat.gob.mx/CartaPorte20"
                xmlns:ns18="http://www.sat.gob.mx/sitio_internet/cfd/catalogos/Combustible"
                xmlns:ns19="http://www.sat.gob.mx/nomina12"
                xmlns:ns20="http://www.sat.gob.mx/sitio_internet/cfd/tipoDatos/tdCFDI"
                xmlns:ns21="http://www.sat.gob.mx/Pagos20">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelValidateInvoicesAP.wsdl"/>
            <oracle-xsl-mapper:rootElement name="ValidateInvoicesAPRs" namespace="http://soa.estrellaroja.com.mx/InvoicesBiz"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelValidateInvoicesAP.wsdl"/>
            <oracle-xsl-mapper:rootElement name="HelperInteger" namespace="http://soa.estrellaroja.com.mx/ElectronicInvoiceAP"/>
            <oracle-xsl-mapper:param name="varCountTotal"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelValidateInvoicesAP.wsdl"/>
            <oracle-xsl-mapper:rootElement name="HelperInteger" namespace="http://soa.estrellaroja.com.mx/ElectronicInvoiceAP"/>
            <oracle-xsl-mapper:param name="varCountErrors"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelValidateInvoicesAP.wsdl"/>
            <oracle-xsl-mapper:rootElement name="HelperInteger" namespace="http://soa.estrellaroja.com.mx/ElectronicInvoiceAP"/>
            <oracle-xsl-mapper:param name="varCountSuccess"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelValidateInvoicesAP.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetHtmlControlRq" namespace="http://soa.estrellaroja.com.mx/SOAUtilitiesTec"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [TUE JAN 09 22:23:45 CST 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="varCountTotal"/>
   <xsl:param name="varCountErrors"/>
   <xsl:param name="varCountSuccess"/>
   <xsl:template match="/">
      <tns:GetHtmlControlRq>
         <tns:TotalSucceeded>
            <xsl:value-of select="$varCountSuccess/ns1:HelperInteger"/>
         </tns:TotalSucceeded>
         <tns:TotalErrors>
            <xsl:value-of select="$varCountErrors/ns1:HelperInteger"/>
         </tns:TotalErrors>
         <tns:TotalProcessed>
            <xsl:value-of select="$varCountTotal/ns1:HelperInteger"/>
         </tns:TotalProcessed>
         <xsl:for-each select="/ns0:ValidateInvoicesAPRs/ns3:Errors/ns3:Error">
            <tns:ErrorsDetails>
               <tns:ErrorDetail>
                  <tns:DataValue>
                     <xsl:value-of select="ns3:ErrorCode"/>
                  </tns:DataValue>
                  <tns:ErrorMessage>
                     <xsl:value-of select="ns3:Description"/>
                  </tns:ErrorMessage>
               </tns:ErrorDetail>
            </tns:ErrorsDetails>
         </xsl:for-each>
      </tns:GetHtmlControlRq>
   </xsl:template>
</xsl:stylesheet>
