package business;

import business.Customer;
import business.ProductDetail;
import java.util.Date;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2023-12-20T22:18:39", comments="EclipseLink-2.7.12.v20230209-rNA")
@StaticMetamodel(Bill.class)
public class Bill_ { 

    public static volatile SingularAttribute<Bill, Long> bill_id;
    public static volatile ListAttribute<Bill, ProductDetail> productDetails;
    public static volatile SingularAttribute<Bill, Date> payment_date;
    public static volatile SingularAttribute<Bill, Integer> status;
    public static volatile SingularAttribute<Bill, Customer> customer;

}