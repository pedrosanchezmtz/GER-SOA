package mx.com.estrellaroja.cloud.utilities.types;


/**
 * Clase <b> ErrorType </b> que contiene una lista de errores.
 * @author Francisco Camacho
 */

public class ErrorType {
    
    /**
     * Metodo constructor por default
     */
    public ErrorType() {
        super();
    }
    
    /**
     * Propiedad que contiene el codigo del error
     */
    
    private String errorCode;

    /**
     * Propiedad que contiene una descripcion corta del error.
     */
    
    private String shortDescription;

    /**
     * Propiedad que contiene la descripcion del error.
     */
    
    private String description;

    /**
     * Propiedad que contiene el proceso del negocio donde se propago el error.
     */
    
    private String businessProcess;

    /**
     * Propiedad que contiene el servicio que fallo.
     */
    
    private String failedService;

    /**
     * Metodo que establece el codigo del error.
     * @param errorCode  Codigo del error.
     */
    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    /**
     * Metodo que recuper el codigo del error.
     * @return String codigo del error.
     */
    public String getErrorCode() {
        return errorCode;
    }

    /**
     * Metodo que establce la descripcion corta del error.
     * @param shortDescription  Descripcion corta del error.
     */
    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    /**
     * Metodo que recupera la descripcion corta  del error.
     * @return String descripcion corta del error.
     */
    public String getShortDescription() {
        return shortDescription;
    }

    /**
     * Metodo que establece la descripcion del error.
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * Metodo que recupera la descripcion del error.
     * @return  String descripcion del error
     */
    public String getDescription() {
        return description;
    }

    /**
     * Metodo que establce el valor del proceso de negocion que ocacion el error.
     * @param businessProcess Proceso de negocio que propago el error.
     */
    public void setBusinessProcess(String businessProcess) {
        this.businessProcess = businessProcess;
    }

    /**
     * Metodo que recupera el valor del proceso de negocio
     * @return String valor del proceso de negocio.
     */
    public String getBusinessProcess() {
        return businessProcess;
    }

    /**
     * Metodo que establce el nombre del servicion que propago el error.
     * @param failedService Nombre del servicio que propago el error.
     */
    public void setFailedService(String failedService) {
        this.failedService = failedService;
    }

    /**
     * Metodo que recupera el nombre del servicio que propago el error.
     * @return Stirng nombre del servivicio que propago el error.
     */
    public String getFailedService() {
        return failedService;
    }
}
