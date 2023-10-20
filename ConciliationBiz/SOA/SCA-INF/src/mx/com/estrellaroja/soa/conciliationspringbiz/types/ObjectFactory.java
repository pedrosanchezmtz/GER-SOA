
package mx.com.estrellaroja.soa.conciliationspringbiz.types;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each
 * Java content interface and Java element interface
 * generated in the mx.com.estrellaroja.soa.conciliationspringbiz.types package.
 * <p>An ObjectFactory allows you to programatically
 * construct new instances of the Java representation
 * for XML content. The Java representation of XML
 * content can consist of schema derived interfaces
 * and classes representing the binding of schema
 * type definitions, element declarations and model
 * groups.  Factory methods for each of these are
 * provided in this class.
 *
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _GetPaymentsCashRq_QNAME =
        new QName("http://soa.estrellaroja.com.mx/ConciliationSpringBiz/Types", "GetPaymentsCashRq");
    private final static QName _GetPaymentsCashPageRq_QNAME =
        new QName("http://soa.estrellaroja.com.mx/ConciliationSpringBiz/Types", "GetPaymentsCashPageRq");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: mx.com.estrellaroja.soa.conciliationspringbiz.types
     *
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link GetPaymentsCashRqType }
     *
     */
    public GetPaymentsCashRqType createGetPaymentsCashRqType() {
        return new GetPaymentsCashRqType();
    }

    /**
     * Create an instance of {@link GetPaymentsCashPageRqType }
     *
     */
    public GetPaymentsCashPageRqType createGetPaymentsCashPageRqType() {
        return new GetPaymentsCashPageRqType();
    }

    /**
     * Create an instance of {@link PaymentType }
     *
     */
    public PaymentType createPaymentType() {
        return new PaymentType();
    }

    /**
     * Create an instance of {@link MetadataType }
     *
     */
    public MetadataType createMetadataType() {
        return new MetadataType();
    }

    /**
     * Create an instance of {@link UserInformationType }
     *
     */
    public UserInformationType createUserInformationType() {
        return new UserInformationType();
    }

    /**
     * Create an instance of {@link EmptyType }
     *
     */
    public EmptyType createEmptyType() {
        return new EmptyType();
    }

    /**
     * Create an instance of {@link SuccessType }
     *
     */
    public SuccessType createSuccessType() {
        return new SuccessType();
    }

    /**
     * Create an instance of {@link ErrorsType }
     *
     */
    public ErrorsType createErrorsType() {
        return new ErrorsType();
    }

    /**
     * Create an instance of {@link ErrorType }
     *
     */
    public ErrorType createErrorType() {
        return new ErrorType();
    }

    /**
     * Create an instance of {@link CallerSystemType }
     *
     */
    public CallerSystemType createCallerSystemType() {
        return new CallerSystemType();
    }

    /**
     * Create an instance of {@link EnvironmentType }
     *
     */
    public EnvironmentType createEnvironmentType() {
        return new EnvironmentType();
    }

    /**
     * Create an instance of {@link AdditionalInformationType }
     *
     */
    public AdditionalInformationType createAdditionalInformationType() {
        return new AdditionalInformationType();
    }

    /**
     * Create an instance of {@link BaseRsType }
     *
     */
    public BaseRsType createBaseRsType() {
        return new BaseRsType();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetPaymentsCashRqType }{@code >}
     *
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link GetPaymentsCashRqType }{@code >}
     */
    @XmlElementDecl(namespace = "http://soa.estrellaroja.com.mx/ConciliationSpringBiz/Types",
                    name = "GetPaymentsCashRq")
    public JAXBElement<GetPaymentsCashRqType> createGetPaymentsCashRq(GetPaymentsCashRqType value) {
        return new JAXBElement<GetPaymentsCashRqType>(_GetPaymentsCashRq_QNAME, GetPaymentsCashRqType.class, null,
                                                      value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetPaymentsCashPageRqType }{@code >}
     *
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link GetPaymentsCashPageRqType }{@code >}
     */
    @XmlElementDecl(namespace = "http://soa.estrellaroja.com.mx/ConciliationSpringBiz/Types",
                    name = "GetPaymentsCashPageRq")
    public JAXBElement<GetPaymentsCashPageRqType> createGetPaymentsCashPageRq(GetPaymentsCashPageRqType value) {
        return new JAXBElement<GetPaymentsCashPageRqType>(_GetPaymentsCashPageRq_QNAME, GetPaymentsCashPageRqType.class,
                                                          null, value);
    }

}
