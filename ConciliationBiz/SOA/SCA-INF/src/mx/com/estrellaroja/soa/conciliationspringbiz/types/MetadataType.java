
package mx.com.estrellaroja.soa.conciliationspringbiz.types;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for MetadataType complex type.
 *
 * <p>The following schema fragment specifies the expected content contained within this class.
 *
 * <pre>
 * &lt;complexType name="MetadataType"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="CallerSystem" type="{http://soa.estrellaroja.com.mx/ConciliationSpringBiz/Types}CallerSystemType" minOccurs="0"/&gt;
 *         &lt;element name="Environment" type="{http://soa.estrellaroja.com.mx/ConciliationSpringBiz/Types}EnvironmentType" minOccurs="0"/&gt;
 *         &lt;element name="UserInformation" type="{http://soa.estrellaroja.com.mx/ConciliationSpringBiz/Types}UserInformationType" minOccurs="0"/&gt;
 *         &lt;element name="AdditionalInformation" type="{http://soa.estrellaroja.com.mx/ConciliationSpringBiz/Types}AdditionalInformationType" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "MetadataType",
         propOrder = { "callerSystem", "environment", "userInformation", "additionalInformation" })
public class MetadataType {

    @XmlElement(name = "CallerSystem")
    protected CallerSystemType callerSystem;
    @XmlElement(name = "Environment")
    protected EnvironmentType environment;
    @XmlElement(name = "UserInformation")
    protected UserInformationType userInformation;
    @XmlElement(name = "AdditionalInformation")
    protected AdditionalInformationType additionalInformation;

    /**
     * Gets the value of the callerSystem property.
     *
     * @return
     *     possible object is
     *     {@link CallerSystemType }
     *
     */
    public CallerSystemType getCallerSystem() {
        return callerSystem;
    }

    /**
     * Sets the value of the callerSystem property.
     *
     * @param value
     *     allowed object is
     *     {@link CallerSystemType }
     *
     */
    public void setCallerSystem(CallerSystemType value) {
        this.callerSystem = value;
    }

    /**
     * Gets the value of the environment property.
     *
     * @return
     *     possible object is
     *     {@link EnvironmentType }
     *
     */
    public EnvironmentType getEnvironment() {
        return environment;
    }

    /**
     * Sets the value of the environment property.
     *
     * @param value
     *     allowed object is
     *     {@link EnvironmentType }
     *
     */
    public void setEnvironment(EnvironmentType value) {
        this.environment = value;
    }

    /**
     * Gets the value of the userInformation property.
     *
     * @return
     *     possible object is
     *     {@link UserInformationType }
     *
     */
    public UserInformationType getUserInformation() {
        return userInformation;
    }

    /**
     * Sets the value of the userInformation property.
     *
     * @param value
     *     allowed object is
     *     {@link UserInformationType }
     *
     */
    public void setUserInformation(UserInformationType value) {
        this.userInformation = value;
    }

    /**
     * Gets the value of the additionalInformation property.
     *
     * @return
     *     possible object is
     *     {@link AdditionalInformationType }
     *
     */
    public AdditionalInformationType getAdditionalInformation() {
        return additionalInformation;
    }

    /**
     * Sets the value of the additionalInformation property.
     *
     * @param value
     *     allowed object is
     *     {@link AdditionalInformationType }
     *
     */
    public void setAdditionalInformation(AdditionalInformationType value) {
        this.additionalInformation = value;
    }

}
