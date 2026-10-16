# Loan Application Management System

# CONTRIBUTORS:

- Simar Singh Lamba
- Deboleena Debroy
- Gargi Deore
- Disha Roy
- Maitreyi Jangame


## Overview

The Loan Application Management System is a console-based Java application developed to simplify the basic loan application and approval process. It uses MySQL for data storage and provides a structured workflow for user management, loan applications, application review, and loan repayment calculations.

The project demonstrates the practical application of Java programming, database connectivity, authentication, and financial calculations in a loan management scenario.

## Features and Modules

### Stage 1: User Authentication and Account Management
- User registration and login
- Logout functionality
- Password reset
- Tracking failed login attempts and account lockout

### Stage 2: User Administration
- Search and manage registered users
- Edit user details
- Activate or deactivate accounts
- Delete user accounts

### Stage 3: Loan Application Management
- Submit loan applications
- Track application status
- Support Pending, Approved, Rejected, and Needs More Info statuses

### Stage 4: Loan Eligibility and Interest Rates
- PAN details and simulated CIBIL score handling
- Loan-type-based interest rate selection
- Support for different loan categories

### Stage 5: Loan Calculations and Notifications
- Calculate monthly EMI
- Calculate total interest and total repayment amount
- Store loan application and calculation details in MySQL
- Provide simulated notification output through the console

## Technology Stack

- **Programming Language:** Java 17
- **Database:** MySQL
- **Database Connectivity:** JDBC
- **Dependency Management:** Apache Maven
- **Development Environment:** Any Java IDE that supports Maven

## Prerequisites

Before running the application, ensure that the following are installed:

- JDK 17 or later
- Apache Maven
- MySQL Server
- MySQL Workbench or another MySQL client

## Installation and Setup

### 1. Clone the Repository

Clone the repository to your local machine and navigate to the project directory.

```bash
git clone <repository-url>
cd LoanApplicationSystem
```

Replace `<repository-url>` with the URL of this GitHub repository.

### 2. Set Up the Database

1. Open MySQL Workbench.
2. Open the SQL script located at `sql/loan_system.sql`.
3. Execute the script to create the `loan_system` database and its required tables.

### 3. Configure Database Credentials

The application uses environment variables for database configuration to avoid storing personal database credentials in the source code.

Configure the following variables:

| Variable | Description |
|---|---|
| `DB_URL` | JDBC connection URL; defaults to `jdbc:mysql://localhost:3306/loan_system` |
| `DB_USER` | MySQL username; defaults to `root` |
| `DB_PASSWORD` | Password for the local MySQL account; must be configured |

On Windows PowerShell, set the variables for the current terminal session:

```powershell
$env:DB_URL="jdbc:mysql://localhost:3306/loan_system"
$env:DB_USER="root"
$env:DB_PASSWORD="your_local_mysql_password"
```

Replace the example password with your own local MySQL password. Do not commit real credentials to the repository.

### 4. Build the Project

From the directory containing `pom.xml`, run:

```bash
mvn clean package
```

Maven will download the required dependencies and attempt to compile the application.

### 5. Run the Application

Run the main class from your IDE using `loan.Main`, or use Maven if the Maven Exec plugin is configured:

```bash
mvn exec:java -Dexec.mainClass="loan.Main"
```

Ensure that MySQL is running and the database configuration is correct before starting the application.

### 6. Configure an Administrator Account

Register a user through the application. To grant that user administrator privileges, execute the following SQL statement in MySQL:

```sql
USE loan_system;

UPDATE users
SET role = 'ROLE_ADMIN'
WHERE username = 'your_username';
```

Replace `your_username` with the registered username.

## Project Structure

```text
LoanApplicationSystem/
├── src/
│   └── main/
│       └── java/
│           └── loan/
│               ├── Admin.java
│               ├── DBConnection.java
│               ├── EmailNotification.java
│               ├── ForgotPassword.java
│               ├── LoanApplication.java
│               ├── LoanApproval.java
│               ├── LoanCalculator.java
│               ├── LoanType.java
│               ├── Login.java
│               ├── Logout.java
│               ├── Main.java
│               ├── Registration.java
│               ├── TestConnection.java
│               └── User.java
├── sql/
│   └── loan_system.sql
├── .env.example
├── .gitignore
├── pom.xml
└── README.md
```

## Limitations

This project is intended for educational purposes and demonstrates the core concepts of a basic loan management system. Some functions are simplified:

- CIBIL score handling is simulated and does not represent an actual credit assessment.
- Notifications are displayed in the console rather than delivered through a live email service.
- The implementation is not intended for real-world financial processing without further security, validation, and testing.

## Future Enhancements

Potential improvements include stronger password security, audit logging, integration with a real email service, enhanced loan eligibility checks, and more comprehensive automated testing.

## License

No license has been specified for this project. Add a suitable open-source license if you intend to permit reuse or distribution.
