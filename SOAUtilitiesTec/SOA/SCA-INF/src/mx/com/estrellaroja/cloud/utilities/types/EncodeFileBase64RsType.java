package mx.com.estrellaroja.cloud.utilities.types;
/**************************************************************************************************
<hr>
<b>File: </b>Interface<b> <code>EncodeFileBase64RsType</code></b><br/>
<b>Version: </b>1.0<br/>
<b>Date: </b>Diciembre 14, 2017<br/>
<b>Author: </b>Francisco Camacho


<p align="justify">
Objeto java que nos ayuda cubrir las necesidades del servicio
<code>SOAUtilities</code> mediante Java exponiendo la funcionalidad con Spring Context.</p><hr>

 **************************************************************************************************/
public class EncodeFileBase64RsType {
    private boolean succcess;
    private ErrorType error;
    private EncodeFileBase64ReturnType returnType;
    public EncodeFileBase64RsType() {
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

    public void setReturnType(EncodeFileBase64ReturnType returnType) {
        this.returnType = returnType;
    }

    public EncodeFileBase64ReturnType getReturnType() {
        return returnType;
    }

    }