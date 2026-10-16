# Loan Application System

A beginner-friendly, console-based Java project using MySQL. The project keeps the original loan-management concept and its existing Java classes, but uses a standard Maven folder structure so it is easier to build, review, and upload to GitHub.

## Main modules

- **Stage 1 — Account access:** registration, login, logout, password reset, failed-login tracking, and account lockout.
- **Stage 2 — Administration:** list, search, edit, activate/deactivate, and delete users.
- **Stage 3 — Loan applications:** submit applications and review their status as Pending, Approved, Rejected, or Needs More Info.
- **Stage 4 — Loan details:** PAN/CIBIL input and loan-type interest-rate logic.
- **Stage 5 — Loan calculations:** EMI, total interest, and total payable are stored with the application; notification output is simulated in the console.

> Notes about the original implementation: notifications are printed to the console rather than sent through a real email server. CIBIL scoring is simulated. Review the code and your assignment rubric to confirm whether extra requirements (such as audit logs or real email delivery) are expected.

## Requirements

- JDK 17 or later
- Maven
- MySQL Server and MySQL Workbench (or another MySQL client)

## 1. Create the database

Open `sql/loan_system.sql` in MySQL Workbench and execute it. This creates the `loan_system` database and the `users` and `loan_applications` tables.

## 2. Configure database access

The application reads database settings from environment variables so credentials are not committed to GitHub.

Set these variables before running:

- `DB_URL` — optional; defaults to `jdbc:mysql://localhost:3306/loan_system`
- `DB_USER` — optional; defaults to `root`
- `DB_PASSWORD` — required; set this to your own local MySQL password

Do not put your actual password in Java source code or commit it to the repository.

### Windows PowerShell example

```powershell
$env:DB_URL="jdbc:mysql://localhost:3306/loan_system"
$env:DB_USER="root"
$env:DB_PASSWORD="your_local_mysql_password"
```

Use your own password locally; do not share it or commit it.

## 3. Build the project

From the folder containing `pom.xml`, run:

```bash
mvn clean package
```

## 4. Run the program

```bash
mvn exec:java -Dexec.mainClass="loan.Main"
```

If the `exec:java` goal is not available in your Maven setup, you can run `loan.Main` from your IDE after importing the folder as an **Existing Maven Project**. Maven will download the MySQL JDBC driver.

## 5. Create an admin user

Register a normal user using the existing registration class, then promote that user to administrator in MySQL:

```sql
USE loan_system;
UPDATE users SET role = 'ROLE_ADMIN' WHERE username = 'your_username';
```

Replace `your_username` with the account you registered.

## Repository contents

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
├── .gitignore
├── pom.xml
└── README.md
```

## Security and project limitations

- Password handling in the original classes is basic and should be improved before any real-world use.
- The CIBIL score is simulated and must not be treated as a real credit assessment.
- Email notifications are console messages, not actual email delivery.
- This is an educational project, not a production loan-processing system.
