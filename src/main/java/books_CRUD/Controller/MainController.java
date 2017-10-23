package books_CRUD.Controller;

import books_CRUD.Services.BookService;
import books_CRUD.Model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@org.springframework.stereotype.Controller
public class MainController {
    @Autowired
    BookService bookService;

    @RequestMapping(value = "/book", method = RequestMethod.GET)
    public ModelAndView book(){
        ModelAndView view = new ModelAndView("/book.jsp");
        return view;
    }

    @RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> getSaved(Book book){
        Map<String, Object> map = new HashMap();
        List<Book> list = bookService.selectAll();

        if (bookService.saveOrUpdate(book)){
            map.put("status", "200");
            map.put("message", "Book was saved successfully!");
            map.put("data", list);
        }
        return map;
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> getAll(){
        Map<String, Object> map = new HashMap();
        List<Book> list = bookService.selectAll();
        if (list != null){
            map.put("status", "200");
            map.put("data", list);
        }
        return map;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> delete(Book book) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (bookService.delete(book)) {
            map.put("status", "200");
            map.put("message", "Book was deleted successfully!");
        }
        return map;
    }
}
