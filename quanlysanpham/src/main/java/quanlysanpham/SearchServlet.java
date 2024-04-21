package quanlysanpham;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchQuery = request.getParameter("searchQuery");

        List<Product> productList = searchProductByName(searchQuery);
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

    private List<Product> searchProductByName(String searchQuery) {
        List<Product> productList = new ArrayList<>();
        productList.add(new Product("Sản phẩm A", 100));
        productList.add(new Product("Sản phẩm B", 150));
        productList.add(new Product("Sản phẩm C", 200));

        List<Product> filteredList = new ArrayList<>();
        for (Product product : productList) {
            if (product.getName().toLowerCase().contains(searchQuery.toLowerCase())) {
                filteredList.add(product);
            }
        }
        return filteredList;
    }
}
