package com.shopsphere.controller;

import com.shopsphere.dao.ProductDAO;
import com.shopsphere.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String categoryParam = request.getParameter("category");
        List<Product> productList;

        if (categoryParam != null && !categoryParam.isEmpty()) {
            try {
                int categoryId = Integer.parseInt(categoryParam);
                productList = productDAO.getProductsByCategory(categoryId);
            } catch (NumberFormatException e) {
                productList = productDAO.getAllProducts();
            }
        } else {
            productList = productDAO.getAllProducts();
        }

        request.setAttribute("products", productList);
        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }
}