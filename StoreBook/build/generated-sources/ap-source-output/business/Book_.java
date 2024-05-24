package business;

import business.Author;
import business.Category;
import business.Publisher;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2023-12-20T22:18:39", comments="EclipseLink-2.7.12.v20230209-rNA")
@StaticMetamodel(Book.class)
public class Book_ { 

    public static volatile ListAttribute<Book, Category> listCategory;
    public static volatile SingularAttribute<Book, Integer> quantity;
    public static volatile SingularAttribute<Book, String> languages;
    public static volatile SingularAttribute<Book, Author> author;
    public static volatile SingularAttribute<Book, Integer> bought;
    public static volatile SingularAttribute<Book, Long> book_id;
    public static volatile SingularAttribute<Book, String> book_name;
    public static volatile SingularAttribute<Book, String> book_img;
    public static volatile SingularAttribute<Book, String> version;
    public static volatile SingularAttribute<Book, String> descriptions;
    public static volatile SingularAttribute<Book, Double> price;
    public static volatile SingularAttribute<Book, Publisher> publisher;
    public static volatile SingularAttribute<Book, Integer> status;

}