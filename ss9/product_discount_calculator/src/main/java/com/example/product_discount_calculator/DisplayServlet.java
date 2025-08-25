package com.example.product_discount_calculator;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "DisplayServlet", value = "/calculate")
public class DisplayServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String describe = req.getParameter("describe");
        double price = Double.parseDouble(req.getParameter("price"));
        double rate = Double.parseDouble(req.getParameter("rate"));

        double result = price * rate * 0.01;
        double priceAfterDiscount = price - result;

        PrintWriter writer = resp.getWriter();
        writer.println("<html>");
        writer.println("Mô tả: " + describe);
        writer.println("Lượng chiết khấu: " + result);
        writer.println("Giá sau khi đã được chiết khấu: " + priceAfterDiscount);
        writer.println("</html>");
    }
}