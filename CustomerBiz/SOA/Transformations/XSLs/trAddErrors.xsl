<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:ns0="http://soa.estrellaroja.com.mx/CustomerBiz" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" exclude-result-prefixes="oracle-xsl-mapper xsi xsd xsl ns0 socket dvm mhdr oraxsl oraext xp20 xref" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns1="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:ns2="http://schemas.oracle.com/bpel/extension" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:client="http://soa.estrellaroja.com.mx/CustomerBiz/bpelSyncCustomers" xmlns:ns4="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec" xmlns:ns3="http://soa.estrellaroja.com.mx/FinancialsTec" xmlns:ns6="http://soa.estrellaroja.com.mx/AuditControlTec">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../../WSDLs/bpelSyncCustomers.wsdl"/>
        <oracle-xsl-mapper:rootElement name="SyncCustomersRs" namespace="http://soa.estrellaroja.com.mx/CustomerBiz"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../../WSDLs/bpelSyncCustomers.wsdl"/>
        <oracle-xsl-mapper:rootElement name="UpdateCustomerRs" namespace="http://soa.estrellaroja.com.mx/CustomerBiz"/>
        <oracle-xsl-mapper:param name="varUpdateCustomerRs.UpdateCustomerRs"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../../WSDLs/bpelSyncCustomers.wsdl"/>
        <oracle-xsl-mapper:rootElement name="CreateCustomerRs" namespace="http://soa.estrellaroja.com.mx/CustomerBiz"/>
        <oracle-xsl-mapper:param name="varCreateCustomerRs.CreateCustomerRs"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../../WSDLs/bpelSyncCustomers.wsdl"/>
        <oracle-xsl-mapper:rootElement name="SyncCustomersRs" namespace="http://soa.estrellaroja.com.mx/CustomerBiz"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [FRI DEC 29 13:07:08 CST 2017].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="varUpdateCustomerRs.UpdateCustomerRs"/>
  <xsl:param name="varCreateCustomerRs.CreateCustomerRs"/>
  <xsl:template match="/">
    <ns0:SyncCustomersRs>
      <ns0:Return>
        <ns0:CreateResult>
          <ns0:OperationName>
            <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:CreateResult/ns0:OperationName"/>
          </ns0:OperationName>
          <ns0:Estaus>
            <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:CreateResult/ns0:Estaus"/>
          </ns0:Estaus>
          <ns0:SuccessRecordCount>
            <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:CreateResult/ns0:SuccessRecordCount"/>
          </ns0:SuccessRecordCount>
          <ns0:ErrorRecordCount>
            <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:CreateResult/ns0:ErrorRecordCount"/>
          </ns0:ErrorRecordCount>
          <ns0:TotalRecordCount>
            <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:CreateResult/ns0:TotalRecordCount"/>
          </ns0:TotalRecordCount>
          <ns0:Errors>
            <xsl:for-each select="/ns0:SyncCustomersRs/ns0:Return/ns0:CreateResult/ns0:Errors/ns0:RecordError">
              <xsl:if test="string-length (ns1:ErrorCode ) > 0">
                <ns0:RecordError>
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
                  <ns0:RecordKey>
                    <xsl:value-of select="ns0:RecordKey"/>
                  </ns0:RecordKey>
                </ns0:RecordError>
              </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="$varCreateCustomerRs.CreateCustomerRs/ns0:CreateCustomerRs/ns0:Return/ns0:Errors/ns0:RecordError">
              <xsl:if test="string-length (ns1:ErrorCode ) > 0">
                <ns0:RecordError>
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
                  <ns0:RecordKey>
                    <xsl:value-of select="ns0:RecordKey"/>
                  </ns0:RecordKey>
                </ns0:RecordError>
              </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="$varCreateCustomerRs.CreateCustomerRs/ns0:CreateCustomerRs/ns0:Return/ns0:NestedOperation/ns0:Errors/ns0:RecordError">
              <xsl:if test="string-length (ns1:ErrorCode ) > 0">
                <ns0:RecordError>
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
                  <ns0:RecordKey>
                    <xsl:value-of select="ns0:RecordKey"/>
                  </ns0:RecordKey>
                </ns0:RecordError>
              </xsl:if>
            </xsl:for-each>
          </ns0:Errors>
          <xsl:if test="/ns0:SyncCustomersRs/ns0:Return/ns0:CreateResult/ns0:NestedOperation/text()">
            <ns0:NestedOperation>
              <ns0:OperationName>
                <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:CreateResult/ns0:NestedOperation/ns0:OperationName"/>
              </ns0:OperationName>
              <ns0:Estaus>
                <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:CreateResult/ns0:NestedOperation/ns0:Estaus"/>
              </ns0:Estaus>
              <ns0:SuccessRecordCount>
                <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:CreateResult/ns0:NestedOperation/ns0:SuccessRecordCount"/>
              </ns0:SuccessRecordCount>
              <ns0:ErrorRecordCount>
                <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:CreateResult/ns0:NestedOperation/ns0:ErrorRecordCount"/>
              </ns0:ErrorRecordCount>
              <ns0:TotalRecordCount>
                <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:CreateResult/ns0:NestedOperation/ns0:TotalRecordCount"/>
              </ns0:TotalRecordCount>
            </ns0:NestedOperation>
          </xsl:if>
        </ns0:CreateResult>
        <ns0:UpdateResult>
          <ns0:OperationName>
            <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:UpdateResult/ns0:OperationName"/>
          </ns0:OperationName>
          <ns0:Estaus>
            <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:UpdateResult/ns0:Estaus"/>
          </ns0:Estaus>
          <ns0:SuccessRecordCount>
            <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:UpdateResult/ns0:SuccessRecordCount"/>
          </ns0:SuccessRecordCount>
          <ns0:ErrorRecordCount>
            <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:UpdateResult/ns0:ErrorRecordCount"/>
          </ns0:ErrorRecordCount>
          <ns0:TotalRecordCount>
            <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:UpdateResult/ns0:TotalRecordCount"/>
          </ns0:TotalRecordCount>
          <ns0:Errors>
            <xsl:for-each select="/ns0:SyncCustomersRs/ns0:Return/ns0:UpdateResult/ns0:Errors/ns0:RecordError">
              <xsl:if test="string-length (ns1:ErrorCode ) > 0">
                <ns0:RecordError>
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
                  <ns0:RecordKey>
                    <xsl:value-of select="ns0:RecordKey"/>
                  </ns0:RecordKey>
                </ns0:RecordError>
              </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="$varUpdateCustomerRs.UpdateCustomerRs/ns0:UpdateCustomerRs/ns0:Return/ns0:Errors/ns0:RecordError">
              <xsl:if test="string-length (ns1:ErrorCode ) > 0">
                <ns0:RecordError>
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
                  <ns0:RecordKey>
                    <xsl:value-of select="ns0:RecordKey"/>
                  </ns0:RecordKey>
                </ns0:RecordError>
              </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="$varUpdateCustomerRs.UpdateCustomerRs/ns0:UpdateCustomerRs/ns0:Return/ns0:NestedOperation/ns0:Errors/ns0:RecordError">
              <xsl:if test="string-length (ns1:ErrorCode ) > 0">
                <ns0:RecordError>
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
                  <ns0:RecordKey>
                    <xsl:value-of select="ns0:RecordKey"/>
                  </ns0:RecordKey>
                </ns0:RecordError>
              </xsl:if>
            </xsl:for-each>
          </ns0:Errors>
          <xsl:if test="/ns0:SyncCustomersRs/ns0:Return/ns0:UpdateResult/ns0:NestedOperation/text()">
            <ns0:NestedOperation>
              <ns0:OperationName>
                <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:UpdateResult/ns0:NestedOperation/ns0:OperationName"/>
              </ns0:OperationName>
              <ns0:Estaus>
                <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:UpdateResult/ns0:NestedOperation/ns0:Estaus"/>
              </ns0:Estaus>
              <ns0:SuccessRecordCount>
                <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:UpdateResult/ns0:NestedOperation/ns0:SuccessRecordCount"/>
              </ns0:SuccessRecordCount>
              <ns0:ErrorRecordCount>
                <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:UpdateResult/ns0:NestedOperation/ns0:ErrorRecordCount"/>
              </ns0:ErrorRecordCount>
              <ns0:TotalRecordCount>
                <xsl:value-of select="/ns0:SyncCustomersRs/ns0:Return/ns0:UpdateResult/ns0:NestedOperation/ns0:TotalRecordCount"/>
              </ns0:TotalRecordCount>
            </ns0:NestedOperation>
          </xsl:if>
        </ns0:UpdateResult>
      </ns0:Return>
    </ns0:SyncCustomersRs>
  </xsl:template>
</xsl:stylesheet>