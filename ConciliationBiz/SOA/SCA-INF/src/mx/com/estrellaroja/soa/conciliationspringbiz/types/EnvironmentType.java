
package mx.com.estrellaroja.soa.conciliationspringbiz.types;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for EnvironmentType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="EnvironmentType"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="Context" type="{http://www.w3.org/2001/XMLSchema}string"/&gt;
 *         &lt;element name="ProccesName" type="{http://www.w3.org/2001/XMLSchema}string"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EnvironmentType", propOrder = {
    "context",
    "proccesName"
})
public class EnvironmentType {

    @XmlElement(name = "Context", required = true)
    protected String context;
    @XmlElement(name = "ProccesName", required = true)
    protected String proccesName;

    /**
     * Gets the value of the context property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getContext() {
        return context;
    }

    /**
     * Sets the value of the context property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setContext(String value) {
        this.context = value;
    }

    /**
     * Gets the value of the proccesName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getProccesName() {
        return proccesName;
    }

    /**
     * Sets the value of the proccesName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setProccesName(String value) {
        this.proccesName = value;
    }

}
