# 🛒 ShopSphere — Full-Stack E-Commerce Web Application

**ShopSphere** is a full-featured Java enterprise e-commerce web application built using **Jakarta EE 10 (Servlet 6.1 & JSP 3.1)**, **JSTL 3.0**, **JDBC**, **MySQL**, and **Apache Tomcat 11**, styled with modern **Bootstrap 5**.

The project is architected with a modular enterprise structure, featuring the web storefront, planned administrative desktop interfaces (**Swing**), distributed services (**RMI**), and network communication layers (**Sockets**).

---

## 🏗️ Architecture

ShopSphere follows the classic **Model-View-Controller (MVC)** enterprise architecture:

```
                      ┌──────────────────────────────────────┐
                      │        Browser / Client              │
                      └──────────────────┬───────────────────┘
                                         │ HTTP Request
                                         ▼
                      ┌──────────────────────────────────────┐
                      │       Apache Tomcat 11 Server        │
                      │                                      │
                      │  ┌────────────────────────────────┐  │
                      │  │  ProductServlet (Controller)   │  │
                      │  │       @WebServlet("/products") │  │
                      │  └───────────────┬────────────────┘  │
                      │                  │                   │
                      │         Calls DAO│ Returns List<Product>
                      │                  ▼                   │
                      │  ┌────────────────────────────────┐  │
                      │  │       ProductDAO (Data Access) │  │
                      │  └───────────────┬────────────────┘  │
                      │                  │                   │
                      │                  │ JDBC / SQL        │
                      │                  ▼                   │
                      │  ┌────────────────────────────────┐  │
                      │  │   MySQL Database (shopsphere)  │  │
                      │  └────────────────────────────────┘  │
                      │                  │                   │
                      │                  │ Forwards Request  │
                      │                  ▼                   │
                      │  ┌────────────────────────────────┐  │
                      │  │    JSP Views + JSTL Core       │  │
                      │  │  (index.jsp, products.jsp, etc)│  │
                      │  └────────────────────────────────┘  │
                      └──────────────────┬───────────────────┘
                                         │ Rendered HTML / CSS
                                         ▼
                      ┌──────────────────────────────────────┐
                      │         User Web Interface           │
                      └──────────────────────────────────────┘
```

---

## ✨ Features

- 🌟 **Modern Storefront UI**: Clean, responsive layout using **Bootstrap 5** with custom gradients and interactive category cards.
- 📦 **Dynamic Product Catalog**: Browse products by category (Electronics, Fashion, Home & Kitchen) or view the full catalog.
- 🏷️ **Jakarta JSTL 3.0 Integration**: Tag-based dynamic rendering (`<c:forEach>`, `<c:choose>`, `<c:if>`) compliant with Tomcat 11.
- 🔐 **Authentication Pages**: Built-in Customer Login (`login.jsp`) and Registration (`register.jsp`) forms.
- 🗄️ **Relational Persistence**: Normalised MySQL database schema with foreign-key relationships between products and categories.
- 🧩 **Modular Enterprise Layout**: Prepared sub-modules for desktop administration (`swing-admin`), remote invocation (`rmi`), and socket networking (`network`).

---

## 🛠️ Technology Stack

| Layer | Technology | Version |
|---|---|---|
| **Language** | Java (JDK) | 17+ (tested on Java 25) |
| **Web Server / Servlet Engine** | Apache Tomcat | 11.0.x |
| **Servlet Specification** | Jakarta Servlet API | 6.1.0 |
| **JSP Specification** | Jakarta Server Pages | 3.1.0 |
| **Tag Library** | GlassFish Jakarta JSTL | 3.0.1 |
| **Database** | MySQL | 8.x / 9.x |
| **JDBC Driver** | MySQL Connector/J | 8.3.0 |
| **Build Tool** | Apache Maven | 3.9+ |
| **Frontend Styling** | Bootstrap | 5.3.0 |

---

## 📂 Project Structure

```
Shopsphere/
├── pom.xml                                   # Maven configuration with Jakarta EE 10 dependencies
├── .gitignore                                # Excludes target/, .class, and IDE metadata
├── README.md                                 # Project documentation
│
├── database/
│   └── shopsphere.sql                        # Schema definition and seed data
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/shopsphere/
│       │       ├── controller/
│       │       │   └── ProductServlet.java   # HTTP controller mapping /products
│       │       ├── dao/
│       │       │   └── ProductDAO.java       # JDBC data access object
│       │       ├── model/
│       │       │   └── Product.java          # Product model bean
│       │       └── util/
│       │           └── DBConnection.java     # Singleton JDBC connection manager
│       └── webapp/
│           ├── index.jsp                     # Home page with hero banner & category cards
│           ├── products.jsp                  # Product catalog display using JSTL
│           ├── login.jsp                     # User sign-in interface
│           ├── register.jsp                  # User registration interface
│           ├── fragments/                    # Reusable JSP components
│           └── WEB-INF/
│               └── tags/                     # Custom tag files
│
├── swing-admin/                              # Desktop administrative portal module
├── network/                                  # Socket client-server communication module
└── rmi/                                      # Remote Method Invocation module
```

---

## 🗄️ Database Setup

The database schema and sample data are defined in [`database/shopsphere.sql`](database/shopsphere.sql).

### 1. Execute SQL Script
Open your MySQL terminal or MySQL Workbench and run:

```sql
source database/shopsphere.sql;
```

### 2. Schema Overview

- **`users`**: Customer and Admin accounts (`user_id`, `name`, `email`, `password`, `mobile`, `role`, `status`).
- **`categories`**: Product classifications (`category_id`, `name`, `description`, `status`).
- **`products`**: Inventory catalog with foreign key to categories (`product_id`, `category_id`, `name`, `brand`, `price`, `stock`, `image_url`).

### 3. Configure Database Credentials
Edit [`src/main/java/com/shopsphere/util/DBConnection.java`](src/main/java/com/shopsphere/util/DBConnection.java):

```java
private static final String URL = "jdbc:mysql://localhost:3306/shopsphere?useSSL=false&serverTimezone=UTC";
private static final String USER = "root";
private static final String PASSWORD = "YOUR_MYSQL_PASSWORD";
```

---

## 🚀 Build & Run

### Prerequisites
- **JDK 17+**
- **Apache Maven 3.9+**
- **Apache Tomcat 11**
- **MySQL Server 8.0+**

### Step 1: Package the WAR File
Run Maven to compile the Java classes and build the `.war` archive:

```bash
mvn clean package
```

This generates `target/shopsphere.war`.

### Step 2: Deploy to Tomcat 11

Copy the generated WAR file into your Tomcat `webapps/` folder:

```bash
# Example for macOS Homebrew installation:
cp target/shopsphere.war /opt/homebrew/opt/tomcat/libexec/webapps/

# Example for standard manual installation:
cp target/shopsphere.war $CATALINA_HOME/webapps/
```

### Step 3: Start Tomcat

```bash
# If using Homebrew Tomcat:
/opt/homebrew/opt/tomcat/bin/catalina start

# If using standard Tomcat:
$CATALINA_HOME/bin/catalina.sh start
```

### Step 4: Open in Browser

Navigate to:
- **Home Page**: [http://localhost:8080/shopsphere/](http://localhost:8080/shopsphere/)
- **Product Catalog**: [http://localhost:8080/shopsphere/products](http://localhost:8080/shopsphere/products)
- **Electronics Category**: [http://localhost:8080/shopsphere/products?category=1](http://localhost:8080/shopsphere/products?category=1)
- **Customer Login**: [http://localhost:8080/shopsphere/login.jsp](http://localhost:8080/shopsphere/login.jsp)
- **Customer Registration**: [http://localhost:8080/shopsphere/register.jsp](http://localhost:8080/shopsphere/register.jsp)

### Step 5: Stop Tomcat (when finished)

```bash
/opt/homebrew/opt/tomcat/bin/catalina stop
```

---

## 👥 Authors & Contribution

Developed as part of the [Java- Repository](https://github.com/adicoder126/java-) by **Aditya Gupta** ([@adicoder126](https://github.com/adicoder126)).
