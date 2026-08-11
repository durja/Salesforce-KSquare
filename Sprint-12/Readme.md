# 🚀 Salesforce Integration – External Recruitment Gateway

## 📌 Overview

This project implements an **external recruitment integration** for the Salesforce Placement Management System.

When a student's application is marked as **Selected**, Salesforce sends the candidate information to an external recruitment platform using a **REST API callout**.

The integration uses **Queueable Apex** for asynchronous processing and **Named Credentials** for secure API authentication.

---

## 🎯 Objectives

* Understand REST API integration in Salesforce
* Perform HTTP callouts using Apex
* Work with JSON request and response data
* Use Queueable Apex for asynchronous callouts
* Configure Named Credentials
* Handle API responses and errors
* Track integration status
* Design retry and duplicate-prevention mechanisms
* Understand synchronous vs asynchronous integration
* Understand point-to-point integration and middleware
* Understand Salesforce Connect and External Objects

---

## 🏗️ Architecture

```text
Student
   ↓
LWC
   ↓
Application
   ↓
Status = Selected
   ↓
Trigger
   ↓
Service Layer
   ↓
Queueable Apex
   ↓
Named Credential
   ↓
REST API
   ↓
External Recruitment System
   ↓
API Response
   ↓
Integration Status
```

---

# 🛠️ Technologies Used

* Salesforce
* Apex
* Queueable Apex
* REST API
* HTTP Callouts
* JSON
* Named Credentials
* SOQL
* Salesforce CLI
* VS Code
* Git & GitHub

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

# 🌐 HTTP Status Codes

| Status Code | Meaning                         |
| ----------- | ------------------------------- |
| 200         | Successful request              |
| 201         | Resource created                |
| 204         | Successful request with no body |
| 400         | Bad request                     |
| 401         | Authentication failure          |
| 403         | Forbidden                       |
| 404         | Resource not found              |
| 500         | External server error           |

---

# 🔒 Security

Credentials are **not hard-coded** in Apex.

A **Named Credential** is used to manage the external API endpoint and authentication configuration.

```text
Apex
 ↓
Named Credential
 ↓
External API
```

This keeps sensitive authentication information outside the source code.

---

# ⚠️ Error Handling

The integration handles different types of API failures.

Examples:

```text
400 → Invalid request
401 → Authentication problem
403 → Permission problem
404 → Resource not found
500 → External server failure
```

Integration failures are recorded using integration status and error information.

---

# 🔁 Retry & Idempotency

Temporary external-system failures may require retry processing.

To avoid duplicate candidates during retries, the integration uses a unique business reference such as the **Application ID** or an external reference ID.

### Example

```text
Application ID: APP001
```

If the same request is processed again, the external system can recognize the existing transaction instead of creating a duplicate candidate.

---

# 🔗 Integration Pattern

This project uses a **point-to-point REST integration**.

```text
Salesforce → External Recruitment System
```

For larger environments containing many external systems, **middleware** can be introduced to handle:

* Routing
* Transformation
* Monitoring
* Retry
* Orchestration
* Protocol conversion

---

# 📊 Salesforce Connect & External Objects

Salesforce Connect and External Objects are considered when Salesforce needs to **access external data without copying all of that data into Salesforce**.

The choice between copying data and accessing external data depends on:

* Data ownership
* Data volume
* Latency
* Reporting requirements
* Security
* Integration requirements

---

# 📁 Key Salesforce Components

```text
force-app/main/default/
│
├── classes/
│   ├── CandidateSyncQueueable.cls
│   └── CandidateSyncService.cls
│
├── triggers/
   └── ApplicationTrigger.trigger

```

> File names may vary depending on the existing Placement Management System structure.

---

# 🧪 Testing

The integration should be tested for:

* Successful candidate submission
* Invalid request
* Authentication failure
* External server failure
* Retry scenario
* Duplicate submission
* Integration status updates
* Unexpected API responses

---

# 💡 Key Learning

This sprint demonstrates how Salesforce can communicate with external systems securely and reliably.

The complete flow is:

```text
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
External System
   ↓
Response
   ↓
Success / Failure / Retry
```

The main engineering principle is:

> **An integration is not just an API call. It must be designed to handle authentication, failures, retries, duplicates, monitoring, and changing external systems.**

---

## ✅ Conclusion

The External Recruitment Gateway extends the Salesforce Placement Management System beyond the Salesforce platform.

It demonstrates:

**Apex + Queueable + REST API + JSON + Named Credentials + Error Handling + Retry + Idempotency + Integration Architecture**

This provides practical experience with enterprise-style Salesforce integration.
