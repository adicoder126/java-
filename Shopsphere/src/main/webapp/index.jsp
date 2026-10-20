<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopSphere - E-Commerce Store</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #0d6efd 0%, #0a58ca 100%);
            color: white;
            padding: 80px 0;
        }
        .category-card { transition: transform 0.2s ease-in-out; }
        .category-card:hover { transform: translateY(-5px); }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <div class="container">
            <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/index.jsp">ShopSphere</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/products">Browse Products</a>
                    </li>
                </ul>
                <div class="d-flex gap-2">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <span class="navbar-text me-2 text-white">Welcome, ${sessionScope.user.name}</span>
                            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light btn-sm">Logout</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-outline-light btn-sm">Login</a>
                            <a href="${pageContext.request.contextPath}/register.jsp" class="btn btn-primary btn-sm">Register</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>

    <!-- Hero Banner -->
    <section class="hero-section text-center">
        <div class="container">
            <h1 class="display-4 fw-bold">Welcome to ShopSphere</h1>
            <p class="lead mb-4">Discover great deals on electronics, fashion, and everyday essentials.</p>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-light btn-lg text-primary fw-bold px-4">Shop Products</a>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-4 font-weight-bold">Shop by Category</h2>
            <div class="row g-4">
                <!-- Electronics -->
                <div class="col-md-4">
                    <div class="card h-100 shadow-sm category-card border-0">
                        <div class="card-body text-center p-4">
                            <div class="display-5 text-primary mb-3">💻</div>
                            <h5 class="card-title">Electronics</h5>
                            <p class="card-text text-muted">Laptops, smartphones, audio devices, and accessories.</p>
                            <a href="${pageContext.request.contextPath}/products?category=1" class="btn btn-outline-primary btn-sm">Browse</a>
                        </div>
                    </div>
                </div>
                <!-- Fashion -->
                <div class="col-md-4">
                    <div class="card h-100 shadow-sm category-card border-0">
                        <div class="card-body text-center p-4">
                            <div class="display-5 text-primary mb-3">👕</div>
                            <h5 class="card-title">Fashion</h5>
                            <p class="card-text text-muted">Trendy apparel, footwear, and designer collections.</p>
                            <a href="${pageContext.request.contextPath}/products?category=2" class="btn btn-outline-primary btn-sm">Browse</a>
                        </div>
                    </div>
                </div>
                <!-- Home & Kitchen -->
                <div class="col-md-4">
                    <div class="card h-100 shadow-sm category-card border-0">
                        <div class="card-body text-center p-4">
                            <div class="display-5 text-primary mb-3">🏠</div>
                            <h5 class="card-title">Home & Kitchen</h5>
                            <p class="card-text text-muted">Quality appliances, furniture, and home accessories.</p>
                            <a href="${pageContext.request.contextPath}/products?category=3" class="btn btn-outline-primary btn-sm">Browse</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-4 mt-5">
        <div class="container">
            <p class="mb-0">&copy; 2026 ShopSphere E-Commerce Project. Built with Java Servlets & JSP.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>