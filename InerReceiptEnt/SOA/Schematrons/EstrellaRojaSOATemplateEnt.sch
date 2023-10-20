<?xml version='1.0' encoding='UTF-8'?>
<schema xmlns="http://www.ascc.net/xml/schematron">
   <ns uri="http://soa.estrellaroja.com.mx/ReceiptEnt" prefix="ns0"/>
   <ns uri="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" prefix="cmn"/>
   <pattern name="Required Fields.">
      <rule context="//ns0:CreateReceiptsRq">
         <assert test="string-length(ns0:FirstElement)>0">El elemento no tiene valor.</assert>
      </rule>
   </pattern>
</schema>
