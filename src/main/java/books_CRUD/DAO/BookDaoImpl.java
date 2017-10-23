package books_CRUD.DAO;

import books_CRUD.Model.Book;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Repository
@Transactional
public class BookDaoImpl implements BookDao {
    @Autowired
    SessionFactory session;

    public List<Book> selectAll() {
        List list = session.getCurrentSession().createSQLQuery("SHOW TABLES LIKE 'book'").list();
        return session.getCurrentSession().createQuery("from books_CRUD.Model.Book").list();
    }

    public boolean saveOrUpdate(Book book) {
        session.getCurrentSession().saveOrUpdate(book);
        return true;
    }

    public boolean delete(Book book) {
        try {
            session.getCurrentSession().delete(book);
        } catch (Exception e) {
            return false;
        }
        return true;
    }
}
