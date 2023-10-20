package mx.com.estrellaroja.soa.conciliationspringbiz;


import mx.com.estrellaroja.soa.conciliationspringbiz.types.GetPaymentsCashPageRqType;
import mx.com.estrellaroja.soa.conciliationspringbiz.types.GetPaymentsCashRqType;

public interface IConciliationSpringBiz {
    
    public GetPaymentsCashPageRqType GetPaymentsCashPage(GetPaymentsCashRqType conciliationCashTPRq) ;
}
