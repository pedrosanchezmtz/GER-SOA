package mx.com.estrellaroja.soa.conciliationspringbiz;

import java.util.logging.Level;
import java.util.logging.Logger;

import java.util.stream.Collectors;

import mx.com.estrellaroja.soa.conciliationspringbiz.types.GetPaymentsCashPageRqType;
import mx.com.estrellaroja.soa.conciliationspringbiz.types.GetPaymentsCashRqType;
import mx.com.estrellaroja.soa.conciliationspringbiz.types.PaymentType;


public class ConciliationSpringBiz implements IConciliationSpringBiz {

    /**
     * <p>
     * Nombre de la clase utilizada para el logger de la aplicaci&oacute;n.
     * </p>
     */
    private static final String CLASS_NAME = ConciliationSpringBiz.class.getName();

    /**
     * <p>
     * Logger de la aplicaci&oacute;n.
     * </p>
     */

    private static final Logger LOGGER = Logger.getLogger(CLASS_NAME);
    
    @Override
    public GetPaymentsCashPageRqType GetPaymentsCashPage(GetPaymentsCashRqType getPaymentsCashRq) {
        final String METHOD_NAME = "GetPaymentsCashPageRqType";
        LOGGER.entering(CLASS_NAME, METHOD_NAME, getPaymentsCashRq);
        GetPaymentsCashPageRqType getPaymentsCashPageRs = new GetPaymentsCashPageRqType();

        GetPaymentsCashRqType getPaymentsCash = new GetPaymentsCashRqType();
        
        
        int totalXpagina=20;
        int counterPage=0;
        int counterItems=0;
        for(PaymentType payment : getPaymentsCashRq.getPayments()){
            if(counterItems>totalXpagina){
                counterPage=counterPage+1;
                counterItems=0;
                getPaymentsCashPageRs.getPage().add(getPaymentsCash);//agregamos la hoja de 5
                getPaymentsCash = new GetPaymentsCashRqType();//creamos una hoja
            }
            PaymentType paymentT=new PaymentType();
            paymentT.setPaymentReference(payment.getPaymentReference());
            paymentT.setReceiptMethod(payment.getReceiptMethod());
            paymentT.setPaymentDate(payment.getPaymentDate());
            getPaymentsCash.getPayments().add(paymentT);
    
            counterItems=counterItems+1;
            

        }
        //agregamos sobrantes
        if(counterItems<=totalXpagina){
            getPaymentsCashPageRs.getPage().add(getPaymentsCash);//agregamos la hoja de 5
        }
        
       /* getPaymentsCashRq.getPayments().forEach((payment)->{
                                                       
           
            if(counterItems>5);
            {
            GetPaymentsCashRqType getPaymentsCash2 = new GetPaymentsCashRqType();
            getPaymentsCashPageRs.getPage().add(getPaymentsCash2);
            PaymentType paymentT=new PaymentType();
                    paymentT.setPaymentReference(payment.getPaymentReference());
                    paymentT.setReceiptMethod(payment.getReceiptMethod());
            getPaymentsCash2.getPayments().add(paymentT);
                    counterItems=0;
                }
            else{
                    PaymentType paymentT=new PaymentType();
                    paymentT.setPaymentReference(payment.getPaymentReference());
                    paymentT.setReceiptMethod(payment.getReceiptMethod());
                    getPaymentsCash2.getPayments().add(paymentT);
                    counterItems=counterItems+1;
                }
        
                                                                    
                                                   
                                                   });
        /*
         * 
        
        conciliationCashTPRq
                conciliationCashTPRq.getConciliate().forEach((conciliacion)->{
            
                ReconciledType Reconciled=new ReconciledType();
                Reconciled.setPaymentReference(conciliacion.getPaymentReference());
                Reconciled.setReceiptMethod(conciliacion.getReceiptMethod());
                Reconciled.setTolerance(conciliacion.getTolerance().toString());
                Reconciled.setTotalTransactions(String.valueOf( Math.round(conciliacion.getTransactions().stream().mapToDouble(x -> x.getTransactionTotal()*100.0).sum())/100.0));
                Reconciled.setTotalPayment(String.valueOf(Math.round(conciliacion.getPaymentsCash().stream().mapToDouble(x -> x.getPaymentTotal()*100.0).sum())/100.0));                                       
                try {
                   Reconciled.setPaymentNumber(conciliacion.getPaymentsCash().get(1).getPaymentNumber());
                                } catch (Exception ex) {
                                        //ex.printStackTrace();
                                }
               /* if(!conciliacion.getPaymentsCash().isEmpty()){
               }
                
                Reconciled.setTransactionsReference(conciliacion.getTransactions().stream().map(x->x.getTransactionNumber()).collect(Collectors.toList()).toString());
                Reconciled.setIdTransactionReference(conciliacion.getTransactions().stream().map(x->x.getIdTransaction()).collect(Collectors.toList()).toString());
                
                
                if(Double.parseDouble(Reconciled.getTotalPayment())>0){
                    if(Math.abs(Math.abs(Double.parseDouble(Reconciled.getTotalPayment()))-Math.abs(Double.parseDouble(Reconciled.getTotalTransactions())))>Math.abs(Double.parseDouble(Reconciled.getTolerance()))) {
                        if(Math.abs(Double.parseDouble(Reconciled.getTotalPayment()))-Math.abs(Double.parseDouble(Reconciled.getTotalTransactions()))<0){
                            Reconciled.setStatus("NCL");
                            Reconciled.setValidationMsj("EL Pago en Cash es Menor a la sumatoria de las Transaciones en TP");
                        }else{
                            Reconciled.setStatus("NCM");
                            Reconciled.setValidationMsj("EL Pago en Cash es Mayor a la sumatoria de las Transaciones en TP");
                        }
                        
                        
                    }else{
                        Reconciled.setStatus("C");
                        Reconciled.setValidationMsj("Pago Conciliado Correctamente");
                    } 
                }
                //Pago sin recibo en Apolo
                else{
                    Reconciled.setStatus("NC");
                    Reconciled.setValidationMsj("El Pago No se encuentra en APOLO Cash");
                }
                reconciledResult.getReconciled().add(Reconciled);
                

                
            
            
            
            });
        
        conciliationCashTPRs.setReconciledResult(reconciledResult);
        //BaseRsType error = null;
        if (null == null) {
            LOGGER.log(Level.SEVERE, "Empty values for mandatory parameters, not possible to continue");
           // error.setSuccess(new SuccessType());
            //error = new BaseRsType();
            /*error.setErrorCode("SPRING-0001");
            error.setFailedService("GetHtmlControl");
            error.setBusinessProcess("SOAUtilitiesTec");
            error.setShortDescription("EMPTY-VARIABLES");
            error.setDescription("The parameter is empty");
            htmlControlRs.setError(error);
            return conciliationCashTPRs;
        }
        try {
            LOGGER.finer("Starting html creation");
            final String HTML_MESSAGE_START = "<div style=\"text-align:left;\">";
           
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Impossible to get html",e);
          /*  htmlControlRs.setSuccess(false);
            error = new ErrorType();
            error.setErrorCode("SPRING-0004");
            error.setFailedService("GetHtmlControl");
            error.setBusinessProcess("SOAUtilitiesTec");
            error.setShortDescription("GET-HTML-FAILED");
            error.setDescription("Error when getting control Html");
            htmlControlRs.setError(error);
            LOGGER.exiting(CLASS_NAME, METHOD_NAME, conciliationCashTPRs);
            return conciliationCashTPRs;
        }*/

        return getPaymentsCashPageRs;
    }

 /*   public static void main(String[] args) {
        
        System.out.println("Iniciando");
        ConciliationCashTPRqType conciliationCashTPRq= new ConciliationCashTPRqType();
        ConciliateType conciliate=new ConciliateType();
        conciliate.setPaymentReference("iuoqwi");
        conciliate.setReceiptMethod("100");
        conciliate.setTolerance(5.0);
        PaymentCashType paymentCash=new PaymentCashType();
        paymentCash.setPaymentTotal(10.0);
        conciliate.getPaymentsCash().add(paymentCash);
        PaymentCashType paymentCash2=new PaymentCashType();
        paymentCash2.setPaymentTotal(15.0);
        conciliate.getPaymentsCash().add(paymentCash2);
        TransactionType transaction= new TransactionType();
        transaction.setTransactionTotal(100.0);
        conciliate.getTransactions().add(transaction);
        TransactionType transaction2= new TransactionType();
        transaction2.setTransactionTotal(200.0);
        conciliate.getTransactions().add(transaction2);
        conciliationCashTPRq.getConciliate().add(conciliate);
        
        ConciliationSpringBiz conciliationSpringBizImpl = new ConciliationSpringBiz();
       ConciliationCashTPRsType conciliationCashTPRs =conciliationSpringBizImpl.ConciliationCashTP(conciliationCashTPRq);
        
       conciliationCashTPRs.getReconciledResult().getReconciled().forEach((conciliacion)->{
               System.out.println(conciliacion.getPaymentNumber());
               System.out.println(conciliacion.getReceiptMethod());
               System.out.println(conciliacion.getTolerance());
               System.out.println(conciliacion.getTotalPayment());
               System.out.println(conciliacion.getTotalTransactions());
           });
    }*/
}
