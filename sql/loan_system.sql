-- Loan Management System database
-- Run this file in MySQL Workbench before starting the application.

CREATE DATABASE IF NOT EXISTS loan_system;
USE loan_system;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(190) NOT NULL UNIQUE,
    mobile VARCHAR(30),
    password VARCHAR(255) NOT NULL,
    role VARCHAR(30) NOT NULL DEFAULT 'ROLE_USER',
    failed_attempts INT NOT NULL DEFAULT 0,
    account_locked BOOLEAN NOT NULL DEFAULT FALSE,
    pan VARCHAR(20),
    cibil_score INT
);

CREATE TABLE IF NOT EXISTS loan_applications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    loan_type VARCHAR(50) NOT NULL,
    loan_amount DECIMAL(14,2) NOT NULL,
    duration INT NOT NULL COMMENT 'Duration in months',
    income DECIMAL(14,2) NOT NULL,
    purpose TEXT,
    interest_rate DECIMAL(5,2) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'Pending',
    rejection_reason TEXT,
    emi DECIMAL(14,2) NOT NULL DEFAULT 0,
    total_interest DECIMAL(14,2) NOT NULL DEFAULT 0,
    total_payable DECIMAL(14,2) NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create an admin account manually after registering a normal account:
-- UPDATE users SET role = 'ROLE_ADMIN' WHERE username = 'your_username';
