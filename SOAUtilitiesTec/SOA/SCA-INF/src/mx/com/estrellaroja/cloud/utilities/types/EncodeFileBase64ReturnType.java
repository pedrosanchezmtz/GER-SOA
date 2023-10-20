package mx.com.estrellaroja.cloud.utilities.types;

/**************************************************************************************************
<hr>
<b>File: </b>Interface<b> <code>EncodeFileBase64ReturnType</code></b><br/>
<b>Version: </b>1.0<br/>
<b>Date: </b>Diciembre 14, 2017<br/>
<b>Author: </b>Francisco Camacho


<p align="justify">
Objeto java que nos ayuda cubrir las necesidades del servicio
<code>SOAUtilities</code> mediante Java exponiendo la funcionalidad con Spring Context.</p><hr>

 **************************************************************************************************/
public class EncodeFileBase64ReturnType {
    private String encodeBase64;
    private String fileName;
    
    public EncodeFileBase64ReturnType() {
        super();
    }

    public void setEncodeBase64(String encodeBase64) {
        this.encodeBase64 = encodeBase64;
    }

    public String getEncodeBase64() {
        return encodeBase64;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileName() {
        return fileName;
    }
}
