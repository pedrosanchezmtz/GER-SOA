package mx.com.estrellaroja.cloud.utilities.types;


/**************************************************************************************************
<hr>
<b>File: </b>Interface<b> <code>CreateZipFileRsType</code></b><br/>
<b>Version: </b>1.0<br/>
<b>Date: </b>Octubre 16, 2017<br/>
<b>Author: </b>Francisco Camacho


<p align="justify">
Objeto java que nos ayuda cubrir las necesidades del servicio
<code>SOAUtilities</code> mediante Java exponiendo la funcionalidad con Sring Context.</p><hr>

 **************************************************************************************************/
public class CreateZipFileRsType {
    
    private boolean succcess;
    private ErrorType error;
    private CreateZipFileReturnType returnType;
    public CreateZipFileRsType() {
        super();
    }

    public void setSucccess(boolean succcess) {
        this.succcess = succcess;
    }

    public boolean isSucccess() {
        return succcess;
    }

    public void setError(ErrorType error) {
        this.error = error;
    }

    public ErrorType getError() {
        return error;
    }

    public void setReturnType(CreateZipFileReturnType returnType) {
        this.returnType = returnType;
    }

    public CreateZipFileReturnType getReturnType() {
        return returnType;
    }

}
