# ☕ Java Projects Repository

A collection of **Java mini-projects** covering core concepts — from GUI development with **Swing (MVC)** to distributed computing with **RMI** and database connectivity with **JDBC**.

---

## 📂 Repository Structure

```
java-/
│
├── README.md
│
├── calculator/                  → 🧮 Swing Calculator & Student Registration (MVC)
│   ├── main.java                   → App entry point
│   ├── Cmodels.java                → Model — arithmetic logic
│   ├── Cviews.java                 → View — Swing GUI layout
│   ├── Ccontroller.java            → Controller — event handling
│   └── StudentRegistration.java    → Standalone registration form
│
├── RMI/                         → 🌐 Remote Method Invocation (Calculator)
│   ├── Calculator.java             → Remote interface (add, subtract)
│   ├── Calculatorimplementation.java → Server-side implementation
│   ├── Server.java                 → RMI server — binds to registry
│   └── client.java                 → RMI client — invokes remote methods
│
├── JDBC/                        → 🗄️ Java Database Connectivity (Starter)
│   ├── README.md                   → JDBC concepts & next steps
│   ├── App.java                    → Root import placeholder
│   ├── src/
│   │   └── App.java                → Main entry point (Hello World)
│   └── bin/
│       └── App.class               → Compiled output
│
└── servulate/                   → 🚀 Maven Project Skeleton
    ├── .gitignore
    ├── pom.xml                     → Maven config (Java 17)
    └── src/
        ├── main/java/com/serculate/
        │   └── Main.java           → Entry point (Hello World)
        └── test/java/              → (empty — ready for tests)
```

---

## 🧮 1. Calculator (Swing MVC)

A **desktop calculator** application built using **Java Swing** following the **Model-View-Controller** design pattern.

### Architecture

```
┌────────────────┐     ┌────────────────┐     ┌────────────────┐
│     View       │────▶│   Controller   │────▶│     Model      │
│  (Cviews.java) │     │(Ccontroller)   │     │ (Cmodels.java) │
│                │◀────│                │◀────│                │
│ • Text fields  │     │ • ActionListener│    │ • add()        │
│ • +, -, *, /   │     │ • Input parsing │    │ • subtract()   │
│ • Result box   │     │ • Error handling│    │ • multiply()   │
└────────────────┘     └────────────────┘     │ • div()        │
                                              └────────────────┘
```

| File | Role | Description |
|------|------|-------------|
| [`main.java`](calculator/main.java) | Entry Point | Launches the Swing app on the EDT |
| [`Cmodels.java`](calculator/Cmodels.java) | Model | Arithmetic operations (`+`, `-`, `*`, `/`) with edge-case handling |
| [`Cviews.java`](calculator/Cviews.java) | View | Swing GUI — input fields, operator buttons, result display |
| [`Ccontroller.java`](calculator/Ccontroller.java) | Controller | Wires button events to model operations |
| [`StudentRegistration.java`](calculator/StudentRegistration.java) | Standalone | Registration form with validation (name, roll, gender, branch, T&C) |

### Features
- ✅ **MVC architecture** — clean separation of concerns
- ✅ **Four operations** — Add, Subtract, Multiply, Divide
- ✅ **Input validation** — handles invalid numbers gracefully
- ✅ **Division by zero** protection — returns `0` instead of crashing
- ✅ **Student Registration Form** — full form with radio buttons, checkboxes, and field validation

### How to Run

```bash
cd calculator
javac *.java
java main                    # Launch Calculator
java StudentRegistration     # Launch Registration Form
```

---

## 🌐 2. RMI (Remote Method Invocation)

A **client-server calculator** using Java RMI — the client invokes arithmetic methods on a remote server object.

### Architecture

```
  ┌──────────────┐         RMI Registry         ┌──────────────┐
  │    Client     │ ◀──── rmi://localhost:5000 ──▶│    Server     │
  │ (client.java) │         /calculator          │ (Server.java) │
  │               │                              │               │
  │ Looks up      │                              │ Binds         │
  │ Calculator    │                              │ Calculator    │
  │ stub          │                              │ implementation│
  └──────┬───────┘                              └──────┬───────┘
         │                                              │
         ▼                                              ▼
  ┌──────────────┐                              ┌──────────────┐
  │  Calculator   │         Remote Call          │ Calculator   │
  │  (Interface)  │ ─────────────────────────▶  │ Implementation│
  │  • add()      │                              │ • add()      │
  │  • subtract() │          Return Value        │ • subtract() │
  │               │ ◀─────────────────────────  │              │
  └──────────────┘                              └──────────────┘
```

| File | Role | Description |
|------|------|-------------|
| [`Calculator.java`](RMI/Calculator.java) | Remote Interface | Defines `add()` and `subtract()` methods |
| [`Calculatorimplementation.java`](RMI/Calculatorimplementation.java) | Implementation | Extends `UnicastRemoteObject`, implements the interface |
| [`Server.java`](RMI/Server.java) | Server | Binds the implementation to the RMI registry on port `5000` |
| [`client.java`](RMI/client.java) | Client | Looks up the remote object and calls `add(5,3)` & `subtract(5,3)` |

### How to Run

```bash
cd RMI

# Terminal 1 — Start RMI Registry
rmiregistry 5000

# Terminal 2 — Start Server
javac *.java
java Server

# Terminal 3 — Run Client
java client
```

**Expected Output (Client):**
```
 8
 2
```

---

## 🗄️ 3. JDBC (Java Database Connectivity)

A **starter project** scaffolded for database connectivity using JDBC. Currently contains the basic structure and a Hello World entry point — ready to be built out with actual database operations.

| File | Description |
|------|-------------|
| [`src/App.java`](JDBC/src/App.java) | Main entry point (Hello World) |
| [`App.java`](JDBC/App.java) | Root-level `java.sql.*` import placeholder |
| [`README.md`](JDBC/README.md) | Detailed JDBC concepts, examples & next steps |

### How to Run

```bash
cd JDBC
javac -d bin src/App.java
java -cp bin App
```

### Status
- ⬜ Database connection not yet implemented
- ⬜ CRUD operations pending
- ⬜ JDBC driver not yet added
- 📖 See [`JDBC/README.md`](JDBC/README.md) for detailed setup guide & code examples

---

## 🚀 4. Servulate (Maven Project)

A **Maven-based Java 17 project skeleton** — standard directory layout, ready to be extended with dependencies and application logic.

| Property | Value |
|----------|-------|
| **Build Tool** | Maven |
| **Java Version** | 17 |
| **Group ID** | `com.serculate` |
| **Artifact ID** | `serculate` |
| **Version** | `1.0-SNAPSHOT` |

| File | Description |
|------|-------------|
| [`pom.xml`](servulate/pom.xml) | Maven build configuration |
| [`Main.java`](servulate/src/main/java/com/serculate/Main.java) | Entry point — prints "Hello world!" |

### How to Run

```bash
cd servulate
mvn compile exec:java -Dexec.mainClass="com.serculate.Main"
# Or without Maven:
javac -d target/classes src/main/java/com/serculate/Main.java
java -cp target/classes com.serculate.Main
```

---

## 🛠️ Tech Stack

| Technology | Used In |
|------------|---------|
| **Java 17** | All projects |
| **Java Swing** | Calculator, Student Registration |
| **Java RMI** | RMI Calculator |
| **JDBC (java.sql)** | JDBC project |
| **Maven** | Servulate |
| **MVC Pattern** | Calculator |

---

## 📋 Prerequisites

- **JDK 17** or higher
- **Maven** (for servulate project only)
- **MySQL / PostgreSQL** (for JDBC — when implemented)

---

## 🏃 Quick Start

```bash
# Clone the repository
git clone https://github.com/adicoder126/java-.git
cd java-

# Run the Calculator
cd calculator && javac *.java && java main

# Run the RMI Server + Client (needs 3 terminals)
cd RMI && javac *.java
# Terminal 1: rmiregistry 5000
# Terminal 2: java Server
# Terminal 3: java client

# Run the Servulate project
cd servulate && mvn compile exec:java -Dexec.mainClass="com.serculate.Main"
```

---

## 👤 Author

**Aditya Gupta** — [@adicoder126](https://github.com/adicoder126)

---

## 📄 License

This repository is for **educational purposes**. Feel free to use and modify.
