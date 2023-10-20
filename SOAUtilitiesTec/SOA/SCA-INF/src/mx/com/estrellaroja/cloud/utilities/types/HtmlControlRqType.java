
package mx.com.estrellaroja.cloud.utilities.types;



public class HtmlControlRqType {

   
    private Integer totalSucceeded;
   
    private Integer totalErrors;
   
    private Integer totalProcessed;
    
    private ErrorDetailsType errorDetails;

    
    public Integer getTotalSucceeded() {
        return totalSucceeded;
    }

   
    public void setTotalSucceeded(Integer value) {
        this.totalSucceeded = value;
    }

    public Integer getTotalErrors() {
        return totalErrors;
    }

    
    public void setTotalErrors(Integer value) {
        this.totalErrors = value;
    }

   
    public Integer getTotalProcessed() {
        return totalProcessed;
    }

   
    public void setTotalProcessed(Integer value) {
        this.totalProcessed = value;
    }

    
    public ErrorDetailsType getErrorsDetails() {
        return errorDetails;
    }

    
    public void setErrorsDetails(ErrorDetailsType value) {
        this.errorDetails = value;
    }

}
