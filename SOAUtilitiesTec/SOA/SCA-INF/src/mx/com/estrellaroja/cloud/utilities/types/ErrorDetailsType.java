
package mx.com.estrellaroja.cloud.utilities.types;

import java.util.ArrayList;

public class ErrorDetailsType {

    private ArrayList<ErrorDetailType> errorDetail;

    public void setErrorDetail(ArrayList<ErrorDetailType> errorDetail) {
        this.errorDetail = errorDetail;
    }

    public ArrayList<ErrorDetailType> getErrorDetail() {
        if (errorDetail == null) {
            errorDetail = new ArrayList<ErrorDetailType>();
        }
        return this.errorDetail;
    }

}
