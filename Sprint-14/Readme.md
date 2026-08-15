# Sprint 13 – Salesforce Security & Access Control

## Overview

Sprint 13 focuses on securing the Placement Management System using Salesforce security and access-control features.

The main goal is to ensure that users can access only the records, fields and actions required for their responsibilities.

## Security Concepts Covered

* Profiles
* Permission Sets
* Permission Set Groups
* Roles and Role Hierarchy
* Organization-Wide Defaults (OWD)
* Sharing Rules
* Object-Level Security
* Field-Level Security (FLS)
* Record-Level Security
* CRUD
* Apex Sharing
* `with sharing`
* `without sharing`
* `inherited sharing`
* Least Privilege
* Secure LWC and Apex design

## User Personas

### Student

Can:

* View their own profile
* View eligible jobs
* Apply for jobs
* View their own applications

Cannot:

* View another student's applications
* Modify another student's profile
* Change selection status
* Access confidential recruiter information

### Placement Officer

Can:

* Create and manage jobs
* Review applications
* Update interview results
* Manage placement information
* View student placement records

### Recruiter

Can:

* View authorised candidates
* Access candidate information relevant to assigned jobs
* Update permitted interview information

### Administrator

Has broader administrative access based on controlled privileges and business requirements.

## Security Architecture

The security model follows multiple layers:

```text
User
  ↓
Authentication
  ↓
Object / Field Access + Record Access
  ↓
Profiles / Permission Sets
  +
OWD / Role Hierarchy / Sharing Rules
  ↓
Apex Security
  ↓
Effective Access
```

Security is not dependent only on the user interface. Important permissions and business rules must also be enforced at the server and data layers.

## Access Levels

### Object-Level Security

Controls whether a user can:

* Create
* Read
* Edit
* Delete

an object.

### Field-Level Security

Controls whether a user can access specific fields.

Sensitive fields such as recruiter notes, internal recommendations and confidential information should not be exposed to Students.

### Record-Level Security

Controls which specific records a user can access.

For example, Students should be able to view their own Applications but not another student's Applications.

## Record Sharing Model

The security model follows a restrictive baseline where appropriate.

```text
OWD
 ↓
Ownership
 ↓
Role Hierarchy
 ↓
Sharing Rules
 ↓
Additional Access
```

The final sharing configuration should be based on the application's business requirements.

## Secure Apex

Apex security was reviewed to ensure that sharing behaviour is intentional.

Example:

```apex
public with sharing class ApplicationService {
    // Application business logic
}
```

`with sharing` helps respect record-sharing rules, but it does not automatically enforce every CRUD and FLS requirement.

Therefore, Apex must also consider:

* Object permissions
* Field permissions
* Record sharing
* User context
* Data exposure
* Appropriate execution mode

## Least Privilege

Each user should receive only the access required to perform their responsibilities.

Examples:

* Students receive access required for their applications.
* Placement Officers receive access required to manage placement workflows.
* Recruiters receive access only to authorised candidate information.
* Integration users receive only the permissions required for integration operations.

## Security Testing

Security testing checks both:

1. Whether the intended user can perform an operation.
2. Whether an unauthorised user is prevented from performing it.

Important scenarios include:

* Student views own Application → Allowed
* Student views another student's Application → Denied
* Student changes Selection Status → Denied
* Student edits Recruiter Notes → Denied
* Placement Officer reviews Application → Allowed
* Recruiter views authorised candidate → Allowed
* Recruiter accesses unrelated confidential information → Denied
* Student modifies another student's profile → Denied
