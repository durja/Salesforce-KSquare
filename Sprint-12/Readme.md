# 🚀 Salesforce External Recruitment Integration

## 📌 Overview

This project integrates the Salesforce Placement Management System with an external recruitment platform using **REST API and Apex Callouts**.

When an application becomes **Selected**, Salesforce sends the candidate information to the external system using **Queueable Apex**.

---

## 🎯 Objectives

* Understand REST API integration
* Perform Apex HTTP Callouts
* Work with JSON
* Use Queueable Apex
* Configure Named Credentials
* Handle API errors and responses
* Understand Retry and Idempotency
* Understand Synchronous vs Asynchronous integration

---

## 🏗️ Architecture

```text
Application
     ↓
Trigger
     ↓
Service
     ↓
Queueable Apex
     ↓
Named Credential
     ↓
REST API
     ↓
External Recruitment System
```

---

## 🚀 Engineering Sprints

### Sprint 32 – External Recruitment Integration

* Define API contract
* Create Queueable Apex
* Configure Named Credential
* Build JSON request
* Perform REST callout
* Process API response

### Sprint 33 – Integration Reliability

* Track Integration Status
* Handle API failures
* Implement retry thinking
* Prevent duplicate submissions using Idempotency

### Sprint 34 – Integration Architecture

Designed different integration scenarios:

* **Synchronous** – Immediate external verification
* **Asynchronous** – Candidate synchronization
* **Scheduled + Batch** – Large data synchronization

---

## 🔐 Security

Credentials are not hard-coded in Apex.

**Named Credentials** are used to manage the external API endpoint and authentication.

---

## ⚠️ Error Handling

Common responses handled:

```text
200 / 201 → Success
400 → Bad Request
401 → Authentication Failure
403 → Forbidden
404 → Not Found
500 → Server Error
```

Integration failures are tracked using status and error information.

---

## 🔁 Retry & Idempotency

Temporary failures can be retried.

A unique identifier such as the **Application ID** can be used to prevent duplicate candidate submissions.

---

## 🛠️ Technologies

* Salesforce
* Apex
* Queueable Apex
* REST API
* JSON
* Named Credentials
* SOQL
* Salesforce CLI
* GitHub

---

## 📁 Main Components

```text
classes/
├── CandidateSyncQueueable.cls
└── CandidateSyncService.cls

triggers/
└── ApplicationTrigger.trigger
```

---

## 📚 Key Learning

This project demonstrates how Salesforce can securely communicate with external systems while handling **authentication, errors, retries, and duplicate processing**.

**Salesforce → Queueable Apex → REST API → External System**
