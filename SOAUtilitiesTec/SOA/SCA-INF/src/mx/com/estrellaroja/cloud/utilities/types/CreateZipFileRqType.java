package mx.com.estrellaroja.cloud.utilities.types;

import java.util.List;

/**************************************************************************************************
<hr>
<b>File: </b>Interface<b> <code>CreateZipFileRsType</code></b><br/>
<b>Version: </b>1.0<br/>
<b>Date: </b>Enero  03, 2018<br/>
<b>Author: </b>Francisco Camacho


<p align="justify">
Objeto java que nos ayuda cubrir las necesidades del servicio
<code>SOAUtilities</code> mediante Java exponiendo la funcionalidad con Sring Context.</p><hr>

 **************************************************************************************************/
public class CreateZipFileRqType {
    
    private String fileNameZip;
    private String pathFileNameZip;
    List<FilesContentType> listFilesContentType;
    
    
    public CreateZipFileRqType() {
        super();
    }

    public void setListFilesContentType(List<FilesContentType> listFilesContentType) {
        this.listFilesContentType = listFilesContentType;
    }

    public List<FilesContentType> getListFilesContentType() {
        return listFilesContentType;
    }

    public void setFileNameZip(String fileNameZip) {
        this.fileNameZip = fileNameZip;
    }

    public String getFileNameZip() {
        return fileNameZip;
    }

    public void setPathFileNameZip(String pathFileNameZip) {
        this.pathFileNameZip = pathFileNameZip;
    }

    public String getPathFileNameZip() {
        return pathFileNameZip;
    }
}
