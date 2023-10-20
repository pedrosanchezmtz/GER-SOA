package mx.com.estrellaroja.cloud.utilities;

import mx.com.estrellaroja.cloud.utilities.types.CreateZipFileRqType;
import mx.com.estrellaroja.cloud.utilities.types.CreateZipFileRsType;
import mx.com.estrellaroja.cloud.utilities.types.EncodeFileBase64RsType;
import mx.com.estrellaroja.cloud.utilities.types.GetDateByTimeZoneRqType;
import mx.com.estrellaroja.cloud.utilities.types.HtmlControlRqType;
import mx.com.estrellaroja.cloud.utilities.types.HtmlControlRsType;


/**************************************************************************************************
<hr>
<b>File: </b>Interface<b> <code>SOAUtilities</code></b><br/>
<b>Version: </b>1.0<br/>
<b>Date: </b>Sep 19, 2017<br/>
<b>Authores: </b>Francisco Camacho, JGN


<p align="justify">
Esta interfaz permite exponer los m&eacute;todos necesarios para cubrir las necesidades del servicio
<code>SOAUtilities</code> mediante Java exponiendo la funcionalidad con Sring Context.</p><hr>

 **************************************************************************************************/
public interface SOAUtilities {


    /**
     * Realiza un cambio de hora a partir de una zona horaria determinada
     * @param GetDateByTimeZoneRqType Objeto que tiene los parametros para la conversión de una fecha
     * @return Fecha con el cambio por la zona horaria
     */
    public String getDateByTimeZone(GetDateByTimeZoneRqType dateByTz);

    /**
     * Crea un archivo  el servidor de weblogic y lo comprime, retorna el resultado en c&oacue;digo base 64
     *
     * @param fileNameZip           Nombre del archivo comprimido
     * @param pathFileNameZip       Ruta del archivo a comprimir
     * @param fileNameToCompress    Nombre del archivo origen
     * @param pathFileNameToCompress    Ruta del archivo origen
     * @return Retorna un tipo donde se tiene el resultado del archivo en base 64.
     */
    public CreateZipFileRsType createZipFile(CreateZipFileRqType createZipFileRqType);

    /**
     * Crea un archivo  el servidor de weblogic y lo comprime, retorna el resultado en c&oacue;digo base 64
     *
     * @param fileName           Nombre del archivo comprimido
     * @param pathfile           Ruta del archivo a comprimir
     * @return Retorna un tipo donde se tiene el resultado del archivo en base 64.
     */
    public EncodeFileBase64RsType encodeFileBase64(String pathfile, String fileName);

    /**
     * <p>
     * Obtiene la cadena en texto plano al decodificar la cadena opaca
     * en xsd:base64Binary quitando de manera opcional los comentarios XML,
     * prólogo XML que afecta a las funciones de SOA para el manejo de XML.
     * </p>
     *
     * @param rawContent la cadena en formato xsd:base64Binary.
     * @param contentStripping true para eliminar comentarios, prólogo XML, etc.
     * @return la cadena en texto plano.
     */
    public String getDecodedContent(String rawContent, boolean contentStripping);
    
    /**
     * Genera contenido html con informaci&oacute;n de la ejecuci&oacute;n de un proceso
     * @param htmlControlRq informaci&oacute;n para generar html
     * @return elemento div
     */
    public HtmlControlRsType getHtmlControl(HtmlControlRqType htmlControlRq);
}
