package mx.com.estrellaroja.cloud.utilities.util;


/**************************************************************************************************
<hr>
<b>File: </b>Interface<b> <code>SOAUtilConstants</code></b><br/>
<b>Version: </b>1.0<br/>
<b>Date: </b>Sep 19, 2017<br/>
<b>Author: </b>Francisco Camacho


<p align="justify">
Clase que contiene constantes para el uso de la interfaz
<code>SOAUtilConstants</code> mediante Java exponiendo la funcionalidad con Spring Context.</p><hr>

 **************************************************************************************************/
public class SOAUtilConstants {

    /**
     * <p align="justify">
     * Constante que tiene la zona horaria de M&eacute;xico para la conversi&oacute;n de fechas</p>
     */
    public final static String TIMEZONE_DEFAULT = "America/Mexico_City";

    /**
     * <p align="justify">
     * Constante que tiene el patron de fechas</p>
     */
    public final static String TIMEFORMATTER_PATTERN = "yyyy-MM-dd HH:mm:ss";

    /**
     * <p align="justify">
     * Constante la zona horaria del ERP Cloud</p>
     */
    public final static String TIMEZONE_ERP_CLOUD = "+00:00";

    /**
     * <p>
     * Marca de inicio de comentarios en XML.
     * </p>
     */
    public static final String OPENING_XML_COMMENT = "<!--";

    /**
     * <p>
     * Marca de fin de comentarios en XML.
     * </p>
     */
    public static final String CLOSING_XML_COMMENT = "-->";
    
    /**
     * <p>
     * Marca el fin del pr&oacute;logo XML.
     * </p>
     */
    public static final String CLOSING_XML_PROLOG = "?>";
}
