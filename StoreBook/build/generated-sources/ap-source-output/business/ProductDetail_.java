package business;

import business.Bill;
import business.Book;
import business.Cart;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2023-12-20T22:18:39", comments="EclipseLink-2.7.12.v20230209-rNA")
@StaticMetamodel(ProductDetail.class)
public class ProductDetail_ { 

    public static volatile SingularAttribute<ProductDetail, Integer> quantity;
    public static volatile SingularAttribute<ProductDetail, Book> book;
    public static volatile SingularAttribute<ProductDetail, Bill> bill;
    public static volatile SingularAttribute<ProductDetail, Long> id;
    public static volatile SingularAttribute<ProductDetail, Cart> cart;

}