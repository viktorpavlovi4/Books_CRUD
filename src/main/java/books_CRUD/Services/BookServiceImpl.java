package books_CRUD.Services;
import books_CRUD.DAO.BookDao;
import books_CRUD.Model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    BookDao bookDao;

    public List<Book> selectAll() {
        return bookDao.selectAll();
    }

    public boolean saveOrUpdate(Book book) {
        return bookDao.saveOrUpdate(book);
    }

    public boolean delete(Book book) {
        return bookDao.delete(book);
    }
}
