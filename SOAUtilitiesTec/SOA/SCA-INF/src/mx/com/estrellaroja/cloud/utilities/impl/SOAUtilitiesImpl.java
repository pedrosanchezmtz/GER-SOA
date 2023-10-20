package mx.com.estrellaroja.cloud.utilities.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import java.io.UnsupportedEncodingException;

import java.text.SimpleDateFormat;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.zip.Adler32;
import java.util.zip.CheckedOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import mx.com.estrellaroja.cloud.utilities.SOAUtilities;
import mx.com.estrellaroja.cloud.utilities.types.CreateZipFileReturnType;
import mx.com.estrellaroja.cloud.utilities.types.CreateZipFileRqType;
import mx.com.estrellaroja.cloud.utilities.types.CreateZipFileRsType;
import mx.com.estrellaroja.cloud.utilities.types.EncodeFileBase64ReturnType;
import mx.com.estrellaroja.cloud.utilities.types.EncodeFileBase64RsType;
import mx.com.estrellaroja.cloud.utilities.types.ErrorDetailType;
import mx.com.estrellaroja.cloud.utilities.types.ErrorType;
import mx.com.estrellaroja.cloud.utilities.types.FilesContentType;
import mx.com.estrellaroja.cloud.utilities.types.GetDateByTimeZoneRqType;
import mx.com.estrellaroja.cloud.utilities.types.HtmlControlReturnType;
import mx.com.estrellaroja.cloud.utilities.types.HtmlControlRqType;
import mx.com.estrellaroja.cloud.utilities.types.HtmlControlRsType;
import mx.com.estrellaroja.cloud.utilities.util.SOAUtilConstants;
import mx.com.estrellaroja.cloud.utilities.util.SOAUtils;

import oracle.soa.common.util.Base64Decoder;

/**************************************************************************************************
<hr>
<b>File: </b>Interface<b> <code>SOAUtilitiesImpl</code></b><br/>
<b>Version: </b>1.0<br/>
<b>Date: </b>Sep 19, 2017<br/>
<b>Authores: </b>Francisco Camacho, JGN


<p align="justify">
Esta interfaz permite exponer los m&eacute;todos necesarios para cubrir las necesidades del servicio
<code>SOAUtilitiesImpl</code> mediante Java exponiendo la funcionalidad con Sring Context.</p><hr>

 **************************************************************************************************/
public class SOAUtilitiesImpl implements SOAUtilities {

    /**
     * <p>
     * Nombre de la clase utilizada para el logger de la aplicaci&oacute;n.
     * </p>
     */
    private static final String CLASS_NAME = SOAUtilitiesImpl.class.getName();

    /**
     * <p>
     * Logger de la aplicaci&oacute;n.
     * </p>
     */
    private static final Logger LOGGER = Logger.getLogger(CLASS_NAME);

    @Override
    public String getDateByTimeZone(GetDateByTimeZoneRqType dateByTz) {

        String timeZoneFrom = dateByTz.getTimeZone();
        Date dateWithTime = dateByTz.getDateToChange();

        if ("".compareTo(timeZoneFrom) == 0)
            timeZoneFrom = SOAUtilConstants.TIMEZONE_DEFAULT;


        if (dateWithTime == null)
            dateWithTime = new Date(System.currentTimeMillis());


        SimpleDateFormat sdf = new SimpleDateFormat(SOAUtilConstants.TIMEFORMATTER_PATTERN);

        String dateWithTimeStr = sdf.format(dateWithTime);

        LocalDateTime ldt =
            LocalDateTime.parse(dateWithTimeStr, DateTimeFormatter.ofPattern(SOAUtilConstants.TIMEFORMATTER_PATTERN));

        ZonedDateTime parisDateTime = ldt.atZone(ZoneId.of(timeZoneFrom));

        ZoneOffset nyOffSet = ZoneOffset.of(SOAUtilConstants.TIMEZONE_ERP_CLOUD);

        ZonedDateTime nyDateTime = parisDateTime.withZoneSameInstant(nyOffSet);

        String formatNyDateTime =
            nyDateTime.format(DateTimeFormatter.ofPattern(SOAUtilConstants.TIMEFORMATTER_PATTERN));


        return formatNyDateTime;
    }


    public CreateZipFileRsType createZipFile(CreateZipFileRqType createZipFileRqType) {
        CreateZipFileRsType createZipRs = new CreateZipFileRsType();
        List<File> filesList = new ArrayList<File>();
        ErrorType error = null;
        if(createZipFileRqType==null){
            createZipRs.setSucccess(false);
            error = new ErrorType();
            error.setErrorCode("SPRING-0001");
            error.setFailedService("CreateZipFile");
            error.setBusinessProcess("SOAUtilitiesTec");
            error.setShortDescription("EMPTY-VARIABLES");
            error.setDescription("The parameters createZipFileRqType is empty");
            createZipRs.setError(error);
            return createZipRs;
        }
        String fileNameZip=createZipFileRqType.getFileNameZip();
        String pathFileNameZip=createZipFileRqType.getPathFileNameZip();
        List<FilesContentType> listFilesContentType=createZipFileRqType.getListFilesContentType();
      
      
        if ("".equals(fileNameZip) || "".equals(pathFileNameZip) || listFilesContentType.size()==0) {
            createZipRs.setSucccess(false);
            error = new ErrorType();
            error.setErrorCode("SPRING-0001");
            error.setFailedService("CreateZipFile ");
            error.setBusinessProcess("SOAUtilitiesTec ");
            error.setShortDescription("EMPTY-VARIABLES");
            error.setDescription("The parameters is empty ");
            createZipRs.setError(error);
            return createZipRs;
        }
        try {
            final int BUFFER = 2048;
            BufferedInputStream origin = null;
            FileOutputStream dest = new FileOutputStream(pathFileNameZip.concat(fileNameZip));
            CheckedOutputStream checksum = new CheckedOutputStream(dest, new Adler32());
            ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(checksum));
            //out.setMethod(ZipOutputStream.DEFLATED);
            File zipFile = null;
            for (FilesContentType filesContentType : listFilesContentType) {
                
                String pathFileNameToCompress=filesContentType.getPathFileNameToCompress();
                String fileNameToCompress=filesContentType.getFileNameToCompress();
                
                if ("".equals(pathFileNameToCompress) || "".equals(fileNameToCompress)) {
                    createZipRs.setSucccess(false);
                    error = new ErrorType();
                    error.setErrorCode("SPRING-0001");
                    error.setFailedService("CreateZipFile");
                    error.setBusinessProcess("SOAUtilitiesTec");
                    error.setShortDescription("EMPTY-VARIABLES");
                    error.setDescription("The parameters is empty");
                    createZipRs.setError(error);
                    return createZipRs;
                }
                
                byte data[] = new byte[BUFFER];
                // get a list of files from current directory
                File fileToCompress = new File(pathFileNameToCompress.concat(fileNameToCompress));
                filesList.add(fileToCompress);

               
                if (fileToCompress != null) {
                    String zipEntryName = "";
                    String zipEntryNameExtesion = "";

                    if (fileNameToCompress.indexOf("_SEQ") > -1) {
                        zipEntryName = fileNameToCompress.substring(0, fileNameToCompress.indexOf("_SEQ"));
                        zipEntryNameExtesion =
                            fileNameToCompress.substring(fileNameToCompress.indexOf("."), fileNameToCompress.length());
                        zipEntryName = zipEntryName.concat(zipEntryNameExtesion);
                    } else {
                        zipEntryName = fileNameToCompress;
                    }

                    FileInputStream fi = new FileInputStream(fileToCompress);
                    origin = new BufferedInputStream(fi, BUFFER);
                    ZipEntry entry = new ZipEntry(zipEntryName);
                    out.putNextEntry(entry);
                    int count;
                    while ((count = origin.read(data, 0, BUFFER)) != -1) {
                        out.write(data, 0, count);
                    }
                    origin.close();
                }
            }
            
            out.close();

            zipFile = new File(pathFileNameZip.concat(fileNameZip));
            String encodeFileBase64 = SOAUtils.encodeBase64FromFile(zipFile);
            if (!"".equals(encodeFileBase64)) {
                createZipRs.setSucccess(true);
                CreateZipFileReturnType returnType = new CreateZipFileReturnType();
                createZipRs.setReturnType(returnType);
                returnType.setEncodeBase64(encodeFileBase64);
            } else {
                createZipRs.setSucccess(false);
                error = new ErrorType();
                error.setErrorCode("SPRING-0003");
                error.setFailedService("CreateZipFile");
                error.setBusinessProcess("SOAUtilitiesTec");
                error.setShortDescription("BASE64-ZIP-FAILED");
                error.setDescription("Error when compress files");
                createZipRs.setError(error);
            }

            
            filesList.add(zipFile);
           

            for (File fileToDelete : filesList) {
                if (fileToDelete != null) {
                    if (fileToDelete.exists())
                        fileToDelete.delete();
                }
            }


        } catch (Exception e) {
            createZipRs.setSucccess(false);
            error = new ErrorType();
            error.setErrorCode("SPRING-0002");
            error.setFailedService("CreateZipFile");
            error.setBusinessProcess("SOAUtilitiesTec");
            error.setShortDescription("Exception");
            error.setDescription(e.getMessage());
            createZipRs.setError(error);

        }
        return createZipRs;
    }

    @Override
    public EncodeFileBase64RsType encodeFileBase64(String pathfile, String fileName) {
        EncodeFileBase64RsType encodeBase64Rs = new EncodeFileBase64RsType();
        ErrorType error = null;
        if ("".equals(encodeBase64Rs) || "".equals(encodeBase64Rs) || "".equals(pathfile) && "".equals(fileName)) {
            encodeBase64Rs.setSucccess(false);
            error = new ErrorType();
            error.setErrorCode("SPRING-0001");
            error.setFailedService("EncodeBase64File");
            error.setBusinessProcess("SOAUtilitiesTec");
            error.setShortDescription("EMPTY-VARIABLES");
            error.setDescription("The parameters is empty");
            encodeBase64Rs.setError(error);
            return encodeBase64Rs;
        }
        try {

            File rawFile = null;

            rawFile = new File(pathfile.concat(fileName));
            String encodeFileBase64 = SOAUtils.encodeBase64FromFile(rawFile);
            if (!"".equals(encodeFileBase64)) {
                encodeBase64Rs.setSucccess(true);
                EncodeFileBase64ReturnType returnType = new EncodeFileBase64ReturnType();
                encodeBase64Rs.setReturnType(returnType);
                returnType.setEncodeBase64(encodeFileBase64);
            } else {
                encodeBase64Rs.setSucccess(false);
                error = new ErrorType();
                error.setErrorCode("SPRING-0003");
                error.setFailedService("EncodeBase64File");
                error.setBusinessProcess("SOAUtilitiesTec");
                error.setShortDescription("BASE64-ENCODE-FAILED");
                error.setDescription("Error when compress files");
                encodeBase64Rs.setError(error);
            }


        } catch (Exception e) {
            encodeBase64Rs.setSucccess(false);
            error = new ErrorType();
            error.setErrorCode("SPRING-0002");
            error.setFailedService("EncodeBase64File");
            error.setBusinessProcess("SOAUtilitiesTec");
            error.setShortDescription("Exception");
            error.setDescription(e.getMessage());
            encodeBase64Rs.setError(error);

        }
        return encodeBase64Rs;
    }

    /**
     * {@inheritDoc
     */
    @Override
    public String getDecodedContent(String rawContent, boolean contentStripping) {
        final String METHOD_NAME = "getStrippedDecodedContent";
        LOGGER.entering(CLASS_NAME, METHOD_NAME, new Object[] { rawContent, contentStripping });

        String decoded = null;

        if (rawContent != null || !rawContent.isEmpty()) {
            LOGGER.finer("There is content to be decoded");

            try {
                decoded = Base64Decoder.decode(rawContent);

                //conditional stripping
                if (contentStripping) {
                    LOGGER.finer("About to strip details");

                    //remove comments and XML prolog
                    decoded = removeComments(decoded);
                    decoded = removeXMLProlog(decoded);
                }

            } catch (UnsupportedEncodingException e) {
                LOGGER.log(Level.SEVERE, "Impossible to decode", e);

            }

        } else {
            LOGGER.finer("Cannot decode empty content");

        }
        
        LOGGER.exiting(CLASS_NAME, METHOD_NAME, decoded);
        return decoded;
    }

    /**
     * <p>
     * Elimina los comentarios al estilo XML del contenido
     * sin importar su pusición; el XML debe ser válido para un
     * óptimo funcionamiento.
     * </p>
     *
     * @param content el contenido.
     * @return la cadena plana sin comentarios.
     */
    private String removeComments(String content) {
        final String METHOD_NAME = "removeComments";
        LOGGER.entering(CLASS_NAME, METHOD_NAME, content);

        String stripped = null;

        if (content == null) {
            throw new IllegalArgumentException("The content cannot be empty");
        }

        //create the builder
        StringBuilder bldr = new StringBuilder(content);
        int startIndex = bldr.indexOf(SOAUtilConstants.OPENING_XML_COMMENT);

        LOGGER.finer("Search all comments");
        while (startIndex != -1) {
            int endIndex = bldr.indexOf(SOAUtilConstants.CLOSING_XML_COMMENT);
            int fixedEndIndex = endIndex + 3;

            LOGGER.finer("Strip the found comment");
            bldr = bldr.replace(startIndex, fixedEndIndex, "");

            //next loop
            startIndex = bldr.indexOf(SOAUtilConstants.OPENING_XML_COMMENT);
        }

        //use the builder content
        stripped = bldr.toString();

        LOGGER.exiting(CLASS_NAME, METHOD_NAME, stripped);
        return stripped;
    }

    /**
     * <p>
     * Se encarga de remove el prólogo de XML en caso de encontrarlo;
     * de lo contrario, no tiene ningún efecto sobre la cadena.
     * </p>
     *
     * @param content el contenido a transformar.
     * @return la cadena modificada si es que fue necesario.
     */
    private String removeXMLProlog(String content) {
        final String METHOD_NAME = "removeXMLProlog";
        LOGGER.entering(CLASS_NAME, METHOD_NAME, content);

        String fixedContent = null;

        if (content == null) {
            throw new IllegalArgumentException("The content cannot be empty");
        }

        int endIndex = content.indexOf(SOAUtilConstants.CLOSING_XML_PROLOG);
        if (endIndex != -1) {
            int index = endIndex + 2;
            fixedContent = content.substring(index);

        } else {
            LOGGER.finer("NO change at all");
            fixedContent = content;

        }

        LOGGER.exiting(CLASS_NAME, METHOD_NAME, fixedContent);
        return fixedContent;
    }
    
    
    public HtmlControlRsType getHtmlControl(HtmlControlRqType htmlControlRq) {
        final String METHOD_NAME = "getHtmlControl";
        LOGGER.entering(CLASS_NAME, METHOD_NAME, htmlControlRq);
        HtmlControlRsType htmlControlRs = new HtmlControlRsType();
        ErrorType error = null;
        if (htmlControlRq.getTotalProcessed() == null) {
            LOGGER.log(Level.SEVERE, "Empty values for mandatory parameters, not possible to continue");
            htmlControlRs.setSuccess(false);
            error = new ErrorType();
            error.setErrorCode("SPRING-0001");
            error.setFailedService("GetHtmlControl");
            error.setBusinessProcess("SOAUtilitiesTec");
            error.setShortDescription("EMPTY-VARIABLES");
            error.setDescription("The parameter is empty");
            htmlControlRs.setError(error);
            return htmlControlRs;
        }
        try {
            LOGGER.finer("Starting html creation");
            final String HTML_MESSAGE_START = "<div style=\"text-align:left;\">";
            String htmlControl = null;
            String processSummary =
                "<p style=\"font-size:1.2em\">&nbsp;Total de &eacute;xitos:&nbsp;" +
                "<span style=\"font-weight:normal\">" +
                (htmlControlRq.getTotalSucceeded() != null ? htmlControlRq.getTotalSucceeded() : "") + "</span></p>\n" +
                "<p style=\"font-size:1.2em\">&nbsp;Total de errores:&nbsp;" + "<span style=\"font-weight:normal\">" +
                (htmlControlRq.getTotalErrors() != null ? htmlControlRq.getTotalErrors() : "") + "</span></p>\n" +
                "<p style=\"font-size:1.2em\">&nbsp;Total de registros procesados:&nbsp;" +
                "<span style=\"font-weight:normal\">" + htmlControlRq.getTotalProcessed() + "</span></p>";
            String tableHeaders =
                "<table style=\"margin-left: 1%;margin-right: 1%;border-collapse: collapse;width:98%\" >\n" +
                "  <tr>\n" +
                "    <th style=\"background-color:black; color:white;border: 1px solid black;text-align:left;\">Llave</th>\n" +
                "    <th style=\"background-color:black; color:white;border: 1px solid black;text-align:left;\">Mensaje de error</th>\n" +
                "  </tr>";
            String tableRows = "";
            
            if(htmlControlRq.getErrorsDetails()!=null){
                for (ErrorDetailType detail : htmlControlRq.getErrorsDetails().getErrorDetail()) {
                    tableRows +=
                        "<tr>\n" + "    <td style=\"font-weight:normal\">" + detail.getDataValue() +
                        "</td>\n" + "    <td style=\"font-weight:normal\">" +
                        detail.getErrorMessage() + "</td>\n" + "  </tr>";
                }
            }
            

            final String MESSAGE_END = "</table><p></p><!--\u00f1--></div>";
            
            if(tableRows.length()>0){
                htmlControl = HTML_MESSAGE_START + processSummary + tableHeaders + tableRows + MESSAGE_END;            
            }else{
                htmlControl = HTML_MESSAGE_START + processSummary  + MESSAGE_END;     
            }
            
            htmlControlRs.setSuccess(true);
            HtmlControlReturnType htmlReturn = new HtmlControlReturnType();
            htmlReturn.setHtmlControl(htmlControl);
            htmlControlRs.setReturnType(htmlReturn);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Impossible to get html",e);
            htmlControlRs.setSuccess(false);
            error = new ErrorType();
            error.setErrorCode("SPRING-0004");
            error.setFailedService("GetHtmlControl");
            error.setBusinessProcess("SOAUtilitiesTec");
            error.setShortDescription("GET-HTML-FAILED");
            error.setDescription("Error when getting control Html");
            htmlControlRs.setError(error);
            LOGGER.exiting(CLASS_NAME, METHOD_NAME, htmlControlRs);
            return htmlControlRs;
        }

        return htmlControlRs;
    }
}
