package business;

import business.Bill;
import business.Cart;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2023-12-20T22:18:39", comments="EclipseLink-2.7.12.v20230209-rNA")
@StaticMetamodel(Customer.class)
public class Customer_ { 

    public static volatile SingularAttribute<Customer, String> customer_password;
    public static volatile SingularAttribute<Customer, String> address;
    public static volatile SingularAttribute<Customer, Integer> role;
    public static volatile SingularAttribute<Customer, String> customer_email;
    public static volatile SingularAttribute<Customer, String> phone_number;
    public static volatile ListAttribute<Customer, Bill> bills;
    public static volatile SingularAttribute<Customer, String> customer_name;
    public static volatile SingularAttribute<Customer, Long> customer_id;
    public static volatile SingularAttribute<Customer, Cart> cart;

}