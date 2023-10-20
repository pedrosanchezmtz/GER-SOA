package mx.com.estrellaroja.cloud.utilities.types;

/**************************************************************************************************
<hr>
<b>File: </b>Interface<b> <code>FilesContentType</code></b><br/>
<b>Version: </b>1.0<br/>
<b>Date: </b>Enero  03, 2018<br/>
<b>Author: </b>Francisco Camacho


<p align="justify">
Objeto java que nos ayuda cubrir las necesidades del servicio
<code>SOAUtilities</code> mediante Java exponiendo la funcionalidad con Sring Context.</p><hr>

 **************************************************************************************************/
public class FilesContentType {
    
    private String fileNameToCompress;
    
    private String pathFileNameToCompress;
    
    /**
     * Default method constructor
     */
    public FilesContentType() {
        super();
    }

    public void setFileNameToCompress(String fileNameToCompress) {
        this.fileNameToCompress = fileNameToCompress;
    }

    public String getFileNameToCompress() {
        return fileNameToCompress;
    }

    public void setPathFileNameToCompress(String pathFileNameToCompress) {
        this.pathFileNameToCompress = pathFileNameToCompress;
    }

    public String getPathFileNameToCompress() {
        return pathFileNameToCompress;
    }
   
    
}
