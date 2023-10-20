
package mx.com.estrellaroja.soa.conciliationspringbiz.types;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for GetPaymentsCashPageRqType complex type.
 *
 * <p>The following schema fragment specifies the expected content contained within this class.
 *
 * <pre>
 * &lt;complexType name="GetPaymentsCashPageRqType"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="Page" type="{http://soa.estrellaroja.com.mx/ConciliationSpringBiz/Types}GetPaymentsCashRqType" maxOccurs="unbounded" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GetPaymentsCashPageRqType", propOrder = { "page" })
public class GetPaymentsCashPageRqType {

    @XmlElement(name = "Page")
    protected List<GetPaymentsCashRqType> page;

    /**
     * Gets the value of the page property.
     *
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the page property.
     *
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getPage().add(newItem);
     * </pre>
     *
     *
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link GetPaymentsCashRqType }
     *
     *
     */
    public List<GetPaymentsCashRqType> getPage() {
        if (page == null) {
            page = new ArrayList<GetPaymentsCashRqType>();
        }
        return this.page;
    }

}
