package mx.com.estrellaroja.cloud.utilities.types;

import java.util.Date;


/**************************************************************************************************
<hr>
<b>File: </b>Interface<b> <code>GetDateByTimeZoneRqType</code></b><br/>
<b>Version: </b>1.0<br/>
<b>Date: </b>Sep 19, 2017<br/>
<b>Author: </b>Francisco Camacho


<p align="justify">
 Clase que contiene los parametros para la petici&oacute;n del metodo de spring
<code>GetDateByTimeZoneRqType</code> mediante Java exponiendo la funcionalidad con Sring Context.</p><hr>

 **************************************************************************************************/
public class GetDateByTimeZoneRqType {
    
    private Date dateToChange;
    
    private String timeZone;


    /**
     * Metodo que estable la fecha que se va convertir a partir de una zona horaria
     * @param dateToChange
     */
    public void setDateToChange(Date dateToChange) {
        this.dateToChange = dateToChange;
    }

    /**
     * Metodo que retorna el valor de la fecha que se va convertir
     * @return
     */
    public Date getDateToChange() {
        return dateToChange;
    }

    /**
     * Metodo que estable la zona horaria.
     * @param timeZone
     */
    public void setTimeZone(String timeZone) {
        this.timeZone = timeZone;
    }

    /**
     * Metodo que retorna la zona horaria.
     * @return
     */
    public String getTimeZone() {
        return timeZone;
    }
}
