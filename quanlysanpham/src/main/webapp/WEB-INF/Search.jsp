<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="quanlysanpham.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tìm kiếm sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type="text"] {
            padding: 10px;
            width: 60%;
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 16px;
        }
        button {
            padding: 10px 20px;
            border: none;
            background-color: #4caf50;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
        .product {
            background-color: #f9f9f9;
            padding: 20px;
            margin-bottom: 10px;
            border-radius: 4px;
        }
        .product h3 {
            color: #333;
            margin-top: 0;
        }
        .product p {
            color: #666;
            margin: 5px 0;
        }
        .no-product {
            text-align: center;
            color: #999;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Tìm kiếm sản phẩm</h2>
        <form action="SearchServlet" method="post">
            <input type="text" name="searchQuery" placeholder="Nhập từ khóa tìm kiếm">
            <button type="submit">Tìm kiếm</button>
        </form>
        <div>
            <% 
                List<Product> productList = (List<Product>) request.getAttribute("productList");
                if (productList != null && !productList.isEmpty()) {
                    for (Product product : productList) { %>
                        <div class="product">
                            <h3><%= product.getName() %></h3>
                            <p>Giá: <%= product.getPrice() %></p>
                        </div>
                    <% }
                } else { %>
                    <div class="no-product">
                        Không tìm thấy sản phẩm nào.
                    </div>
                <% } %>
        </div>
    </div>
</body>
</html>
