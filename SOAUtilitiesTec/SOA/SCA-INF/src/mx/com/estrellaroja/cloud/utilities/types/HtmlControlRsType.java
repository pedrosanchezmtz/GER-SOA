
package mx.com.estrellaroja.cloud.utilities.types;


public class HtmlControlRsType {

    private boolean success;
    private ErrorType error;    
    private HtmlControlReturnType returnType;


    public void setSuccess(boolean success) {
        this.success = success;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setError(ErrorType error) {
        this.error = error;
    }

    public ErrorType getError() {
        return error;
    }

    public void setReturnType(HtmlControlReturnType returnType) {
        this.returnType = returnType;
    }

    public HtmlControlReturnType getReturnType() {
        return returnType;
    }


}
