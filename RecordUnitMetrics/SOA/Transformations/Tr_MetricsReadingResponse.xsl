<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:tns="http://soa.estrellaroja.com.mx/ReadingsCommon" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:ns1="http://soa.estrellaroja.com.mx/MileageSine" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns3="http://soa.estrellaroja.com.mx/MileageTomTom" xmlns:ns0="http://soa.estrellaroja.com.mx/MileageControlnet" xmlns:ns4="http://xmlns.oracle.com/pcbpel/adapter/db/GetMileageExcel" xmlns:ns2="http://soa.estrellaroja.com.mx/MileageOmnitracs" exclude-result-prefixes=" oracle-xsl-mapper xsi xsd xsl ns1 ns3 ns0 ns4 ns2 tns oraxsl" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns9="http://xmlns.oracle.com/pcbpel/adapter/db/OSB_EstrellaRoja/DEV_APIUnitMetricsTec/GetMileageExcel" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns6="http://xmlns.oracle.com/OSB_EstrellaRoja/DEV_APIUnitMetricsTec/GetMileageSine" xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:ns7="http://xmlns.oracle.com/OSB_EstrellaRoja/DEV_APIUnitMetricsTec/GetMileageOmnitracs" xmlns:ns5="http://xmlns.oracle.com/OSB_EstrellaRoja/DEV_APIUnitMetricsTec/GetMileageControlnet" xmlns:ns8="http://xmlns.oracle.com/OSB_EstrellaRoja/DEV_APIUnitMetricsTec/GetMileageTomTom" xmlns:client="http://soa.estrellaroja.com.mx/RecordUnitMterics" xmlns:ns11="http://soa.estrellaroja.com.mx/ReportReadings" xmlns:ns10="http://soa.estrellaroja.com.mx/ReportAsset" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:ns12="http://soa.estrellaroja.com.mx/AssetMetricReadings" xmlns:ns13="http://xmlns.oracle.com/pcbpel/adapter/db/EAMOriginPriority" xmlns:ns14="http://soa.estrellaroja.com.mx/AssetMetricReadingExcel">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/CONTROLNET/Mileage/GetMileageControlnet.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetMileageControlnetResponse" namespace="http://soa.estrellaroja.com.mx/MileageControlnet"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/SINE/Mileage/GetMileageSine.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetMileageSineResponse" namespace="http://soa.estrellaroja.com.mx/MileageSine"/>
            <oracle-xsl-mapper:param name="Out_GetMileageSine.reply"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/OMNITRACS/Mileage/GetMileageOmnitracs.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetMileageOmnitracsResponse" namespace="http://soa.estrellaroja.com.mx/MileageOmnitracs"/>
            <oracle-xsl-mapper:param name="Out_GetMileageOmnitracs.reply"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/TOMTOM/Mileage/GetMileageTomTom.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetMileageTomTomResponse" namespace="http://soa.estrellaroja.com.mx/MileageTomTom"/>
            <oracle-xsl-mapper:param name="Out_GetTomTom.reply"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/EXCEL/Mileage/GetMileageExcel.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetMileageExcelOutputCollection" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/GetMileageExcel"/>
            <oracle-xsl-mapper:param name="Out_GetMileageExcel.GetMileageExcelOutputCollection"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/RecordUnitMterics.wsdl"/>
            <oracle-xsl-mapper:rootElement name="MetricsReading" namespace="http://soa.estrellaroja.com.mx/ReadingsCommon"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [MON JAN 06 15:58:28 CST 2020].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="Out_GetMileageSine.reply"/>
   <xsl:param name="Out_GetMileageOmnitracs.reply"/>
   <xsl:param name="Out_GetTomTom.reply"/>
   <xsl:param name="Out_GetMileageExcel.GetMileageExcelOutputCollection"/>
   <xsl:template match="/">
      <tns:MetricsReading>
         <xsl:for-each select="/ns0:GetMileageControlnetResponse/ns0:topLevelArray">
            <xsl:if test="ns0:unidad != 0">
               <tns:Reading>
                  <tns:assetNumber>
                     <xsl:value-of select="ns0:unidad"/>
                  </tns:assetNumber>
                  <tns:readingDate>
                     <xsl:value-of select="concat (ns0:fecha, &quot;.000+00:00&quot; )"/>
                  </tns:readingDate>
                  <tns:readingValue>
                     <xsl:value-of select="ns0:lecturaAcomulada"/>
                  </tns:readingValue>
                  <tns:origin>CONTROLNET</tns:origin>
               </tns:Reading>
            </xsl:if>
         </xsl:for-each>
         <xsl:for-each select="$Out_GetMileageSine.reply/ns1:GetMileageSineResponse/ns1:topLevelArray">
          <xsl:if test="ns1:unidad != 0">
            <tns:Reading>
               <tns:assetNumber>
                  <xsl:value-of select="ns1:unidad"/>
               </tns:assetNumber>
               <tns:readingDate>
                     <xsl:value-of select="concat (ns1:fecha, &quot;.000+00:00&quot; )"/>
                  </tns:readingDate>
               <tns:readingValue>
                  <xsl:value-of select="ns1:lecturaAcomulada"/>
               </tns:readingValue>
               <tns:origin>SINE</tns:origin>
            </tns:Reading>
            </xsl:if>
         </xsl:for-each>
         <xsl:for-each select="$Out_GetMileageOmnitracs.reply/ns2:GetMileageOmnitracsResponse/ns2:topLevelArray">
          <xsl:if test="string-length (ns2:unidad ) > 0">
            <tns:Reading>
               <tns:assetNumber>
                  <xsl:value-of select="ns2:unidad"/>
               </tns:assetNumber>
               <tns:readingDate>
                     <xsl:value-of select="concat (ns2:fecha, &quot;.000+00:00&quot; )"/>
                  </tns:readingDate>
               <tns:readingValue>
                  <xsl:value-of select="ns2:lecturaAcomulada"/>
               </tns:readingValue>
               <tns:origin>OMNITRACS</tns:origin>
            </tns:Reading>
            </xsl:if>
         </xsl:for-each>
         <xsl:for-each select="$Out_GetTomTom.reply/ns3:GetMileageTomTomResponse/ns3:topLevelArray">
          <xsl:if test="ns3:vehiculo != 0">
            <tns:Reading>
                  <xsl:choose>
                     <xsl:when test="string-length (ns3:vehiculo ) = 1">
                        <tns:assetNumber>
                           <xsl:value-of select="concat (&quot;000&quot;, ns3:vehiculo )"/>
                        </tns:assetNumber>
                     </xsl:when>
                     <xsl:when test="string-length (ns3:vehiculo ) = 2">
                        <tns:assetNumber>
                           <xsl:value-of select="concat (&quot;00&quot;, ns3:vehiculo )"/>
                        </tns:assetNumber>
                     </xsl:when>
                     <xsl:when test="string-length (ns3:vehiculo ) = 3">
                        <tns:assetNumber>
                           <xsl:value-of select="concat (&quot;0&quot;, ns3:vehiculo )"/>
                        </tns:assetNumber>
                     </xsl:when>
                     <xsl:otherwise>
                     <tns:assetNumber>
                           <xsl:value-of select="ns3:vehiculo"/>
                        </tns:assetNumber>
                     </xsl:otherwise>
                  </xsl:choose>
                  <tns:readingDate>
                     <xsl:value-of select="concat (ns3:fechaFin, &quot;.000+00:00&quot; )"/>
                  </tns:readingDate>
               <tns:readingValue>
                  <xsl:value-of select="ns3:cuentaKmFin"/>
               </tns:readingValue>
               <tns:origin>TOMTOM</tns:origin>
            </tns:Reading>
            </xsl:if>
         </xsl:for-each>
         <xsl:for-each select="$Out_GetMileageExcel.GetMileageExcelOutputCollection/ns4:GetMileageExcelOutputCollection/ns4:GetMileageExcelOutput">
            <tns:Reading>
               <tns:assetNumber>
                  <xsl:value-of select="ns4:ASSET_NUMBER"/>
               </tns:assetNumber>
               <tns:readingDate>
                  <xsl:value-of select="ns4:READING_DATE"/>
               </tns:readingDate>
               <tns:readingValue>
                  <xsl:value-of select="ns4:READING_VALUE"/>
               </tns:readingValue>
               <tns:origin>
                  <xsl:value-of select="ns4:ORIGIN"/>
               </tns:origin>
            </tns:Reading>
         </xsl:for-each>
      </tns:MetricsReading>
   </xsl:template>
</xsl:stylesheet>