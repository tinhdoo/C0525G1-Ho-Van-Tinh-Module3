import entity.customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "list", urlPatterns = "/list")
public class customerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<customer> customers = new ArrayList<>();
        customers.add(new customer("Mai Văn Hoàn", LocalDate.of(1983, 8, 20), "Hà Nội", "images/img1.jpg"));
        customers.add(new customer("Nguyễn Văn Nam", LocalDate.of(1983, 8, 21), "Bắc Giang", "images/img1.jpg"));
        customers.add(new customer("Nguyễn Thái Hoà", LocalDate.of(1983, 8, 22), "Nam Định", "images/img1.jpg"));
        customers.add(new customer("Trần Đăng Khoa", LocalDate.of(1983, 8, 17), "Hà Tây", "images/img1.jpg"));
        customers.add(new customer("Nguyễn Đình Thi", LocalDate.of(1983, 8, 19), "Hà Nội", "images/img1.jpg"));

        req.setAttribute("customers", customers);
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
}