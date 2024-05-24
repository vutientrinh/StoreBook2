package business;

import business.Book;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2023-12-20T22:18:39", comments="EclipseLink-2.7.12.v20230209-rNA")
@StaticMetamodel(Publisher.class)
public class Publisher_ { 

    public static volatile SingularAttribute<Publisher, Long> publisher_id;
    public static volatile ListAttribute<Publisher, Book> books;
    public static volatile SingularAttribute<Publisher, String> publisher_name;

}