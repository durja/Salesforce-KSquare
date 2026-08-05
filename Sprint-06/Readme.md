# 🚀 Placement Management System 

A Salesforce Apex project demonstrating how to retrieve, validate, create, and update placement application records using **SOQL**, **DML**, and **Apex**.

---

## 📌 Project Overview

This project simulates a **Placement Management System** where students can apply for company job opportunities. The application retrieves student and job information, validates eligibility, prevents duplicate applications, creates new application records, and updates application status.

---

## ✨ Features

* 🔍 Retrieve Student Information using SOQL
* 💼 Retrieve Job Eligibility Criteria
* 🚫 Prevent Duplicate Applications
* 📝 Create New Application Records using DML
* 🔄 Update Application Status
* ✅ Complete End-to-End Placement Transaction

---

## 🛠️ Technologies Used

* Salesforce Apex
* SOQL (Salesforce Object Query Language)
* DML (Data Manipulation Language)
* Salesforce Custom Objects

---

## 📂 Custom Objects

* Student
* Job
* Application

---

## 📁 Apex Classes

* StudentService.cls
* JobService.cls
* ApplicationService.cls
* UpdateApplicationService.cls
* PlacementService.cls

---

## 🔄 Business Flow

```text
Receive Request
        ↓
Retrieve Student
        ↓
Retrieve Job
        ↓
Check Duplicate Application
        ↓
Validate Eligibility
        ↓
Create Application
        ↓
Save Record (DML)
        ↓
Display Confirmation
```

---

## 📚 Sprint Coverage

### Sprint 7

* Retrieve student information required for eligibility validation.

### Sprint 8

* Retrieve job eligibility criteria.

### Sprint 9

* Prevent duplicate applications.

### Sprint 10

* Create and save a new application record.

### Sprint 11

* Update application status.

### Sprint 12

* Complete the full business transaction using SOQL, DML, and Apex.

---

## 🎯 Learning Outcomes

* Retrieve business data efficiently using SOQL.
* Perform data manipulation using DML.
* Apply business validation before database operations.
* Build reusable Apex service classes.
* Understand enterprise transaction flow in Salesforce.

---

## 📸 Project Screenshots

Add screenshots here, such as:

* Student Record
* Job Record
* Application Record
* Apex Classes
* Execute Anonymous Results
* Debug Logs
