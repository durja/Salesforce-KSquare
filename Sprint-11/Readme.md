# Sprint 10 – LWC Component Architecture

## 📌 Overview

This sprint focused on building a more structured **Salesforce Lightning Web Component (LWC)** application using component communication, forms, Lightning Data Service, reactive data, reusable components, and Apex integration.

The main goal was to build multiple focused components that communicate with each other instead of using one large component.

## 🚀 Engineering Sprints

### 🔹 Sprint 27 – Component Communication

* Implemented Parent → Child communication using `@api`.
* Implemented Child → Parent communication using `CustomEvent`.
* Used `event.detail` to pass required data.
* Built JobCard communication for **View Details** and **Apply** actions.

### 🔹 Sprint 28 – Student Profile Form

* Built a Student Profile form using Salesforce Lightning base components.
* Used **Lightning Data Service (LDS)** for record editing.
* Added success and error handling.
* Implemented required field handling and form submission.

### 🔹 Sprint 29 – Reactive Data & Refresh

* Implemented component refresh after profile updates.
* Used `@wire` for reactive Apex data.
* Used `refreshApex()` to refresh stale job information.
* Maintained consistency between Student Profile and Eligible Jobs.

### 🔹 Sprint 30 – Reusable Empty State

* Created a reusable `EmptyState` LWC.
* Used `@api` properties for title, message, and action label.
* Used Custom Events for optional actions.
* Designed the component for reuse across multiple pages.

### 🔹 Sprint 31 – Final Integration

* Integrated LWC components with Apex.
* Implemented job application functionality.
* Added server-side duplicate application validation.
* Connected component communication, Apex, SOQL, DML, and UI refresh into one workflow.

## 🛠️ Technologies Used

* Salesforce Lightning Web Components (LWC)
* JavaScript
* HTML
* Apex
* SOQL
* DML
* Lightning Data Service (LDS)
* `@api`
* `@wire`
* Custom Events
* `refreshApex()`

## 🏗️ Key Architecture

```text
Student Placement Portal
│
├── Student Profile
│      └── LDS Form
│
├── Eligible Jobs
│      └── Job Card
│
├── Job Details
│
├── My Applications
│
└── Empty State
```

## 🔄 Application Flow

```text
User Action
    ↓
LWC Component
    ↓
Custom Event
    ↓
Parent Component
    ↓
Apex
    ↓
SOQL / Business Validation
    ↓
DML
    ↓
Salesforce Record
    ↓
UI Refresh
```

## 📚 Key Learnings

* Parent-child communication in LWC
* Custom event-driven architecture
* Lightning Data Service
* Reactive data and `refreshApex()`
* Client-side and server-side validation
* Reusable LWC components
* Apex integration
* Clean component responsibilities
* Avoiding large "God Components"

## ✅ Outcome

Built a more modular **Student Placement Portal** where components have clear responsibilities and communicate through defined interfaces. The implementation demonstrates how LWC, Apex, Salesforce data, and UI behaviour work together as an application.
