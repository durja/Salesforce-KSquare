# 🚀 Sprint 12 – Git, Salesforce CLI, Metadata & Deployment

## 📌 Overview

Sprint 12 focuses on managing and deploying a Salesforce application using a professional development workflow.

In this sprint, I learned how to use **Git and GitHub for source control**, **Salesforce CLI for Salesforce development**, and how Salesforce **metadata is retrieved, version-controlled, tested and deployed** between environments.

The sprint also covers **branches, commits, Pull Requests, merge conflicts, Sandboxes, Scratch Orgs, Changesets and Metadata API**.

---

## 🎯 Learning Objectives

By completing this sprint, I learned how to:

* Understand the importance of Git in Salesforce development
* Use Git repositories for source control
* Create and work with branches
* Commit and push changes
* Pull changes from a remote repository
* Understand Pull Requests and code reviews
* Understand Salesforce metadata
* Use Salesforce CLI (`sf`)
* Authenticate a Salesforce org using CLI
* Retrieve Salesforce metadata
* Deploy Salesforce metadata
* Understand Sandboxes
* Understand Scratch Orgs
* Understand Changesets
* Understand the Metadata API
* Understand deployment dependencies
* Handle basic Git merge conflicts
* Test changes before deployment
* Document a reproducible deployment process

---

# 🛠️ Technologies Used

* Salesforce
* Salesforce CLI (`sf`)
* Git
* GitHub
* Visual Studio Code
* Apex
* Lightning Web Components (LWC)
* Salesforce Metadata

---

# 🔹 Engineering Sprint 35 – Create the Placement Project Repository

A professional GitHub repository was created for the Placement Management System.

### Git Workflow

```text
Local Development
       ↓
Git Repository
       ↓
Feature Branch
       ↓
Commit
       ↓
Push
       ↓
Pull Request
       ↓
Code Review
       ↓
Merge
```

### Important Git Commands

```bash
git clone <repository-url>

git checkout -b feature/placement-update

git status

git add .

git commit -m "Add placement feature"

git push origin feature/placement-update

git pull
```

### Key Concepts

**Clone** – Downloads a Git repository to the local machine.

**Commit** – Records a logical change in the local Git history.

**Push** – Sends local commits to the remote GitHub repository.

**Pull** – Retrieves changes from the remote repository.

**Branch** – Provides an isolated place to develop changes without directly modifying the main code.

---

# 🔹 Engineering Sprint 36 – Retrieve Salesforce Metadata

Salesforce metadata represents the structure and configuration of the Salesforce application.

Examples include:

* Custom Objects
* Custom Fields
* Apex Classes
* Apex Triggers
* Lightning Web Components
* Flows
* Configuration metadata

The metadata was retrieved from Salesforce into the local project so that it could be managed using Git.

### Salesforce CLI Workflow

```text
Salesforce Org
      ↓
Salesforce CLI
      ↓
Retrieve Metadata
      ↓
Local Project
      ↓
Git Repository
```

### Example CLI Commands

```bash
sf org list

sf project retrieve start
```

After retrieval, the source files were inspected to understand how Salesforce represents:

* Apex
* LWC
* Objects
* Fields
* Flows

---

# 🔹 Engineering Sprint 37 – Code Review

A feature branch was used to isolate development work.

### Code Review Workflow

```text
Feature Branch
      ↓
Make Changes
      ↓
Commit
      ↓
Push
      ↓
Pull Request
      ↓
Code Review
      ↓
Improvements
      ↓
Merge
```

### Review Checklist

#### Apex

* Is the code bulkified?
* Is the responsibility clear?
* Is SOQL used appropriately?
* Is DML performed outside loops?
* Is error handling present?
* Are tests available?

#### LWC

* Is component responsibility clear?
* Are names meaningful?
* Is loading handled?
* Is error handling present?
* Is business logic unnecessarily duplicated?

#### Security

* Are secrets protected?
* Are sharing and security considerations handled correctly?

#### Integration

* Are Named Credentials used where required?
* Is integration failure handled?
* Is duplicate processing considered?

---

# 🔹 Engineering Sprint 38 – Deployment Comparison

Different Salesforce development and deployment approaches were studied.

| Approach           | Purpose                                                  |
| ------------------ | -------------------------------------------------------- |
| **Salesforce CLI** | Developer-oriented command-line workflow                 |
| **Changesets**     | Salesforce-native metadata movement between related orgs |
| **Metadata API**   | Programmatic metadata deployment and retrieval           |
| **Scratch Orgs**   | Temporary source-driven development environments         |
| **Sandboxes**      | Longer-lived development, testing or UAT environments    |

### When to Use Them

**Git + Salesforce CLI**

Best suited for a modern source-driven development workflow.

**Changesets**

Useful in traditional Salesforce deployment processes between related Salesforce orgs.

**Scratch Orgs**

Useful for temporary and isolated feature development.

**Sandboxes**

Useful for development, testing and UAT depending on the environment.

---

# 🔹 Engineering Sprint 39 – Controlled Deployment

The Placement Management System was prepared for a controlled deployment workflow.

### Deployment Pipeline

```text
Development
     ↓
Feature Branch
     ↓
Commit
     ↓
Push
     ↓
Pull Request
     ↓
Code Review
     ↓
Merge
     ↓
Development/Test Org
     ↓
Run Tests
     ↓
Manual Verification
     ↓
Deployment Documentation
```

### Deployment Commands

Authenticate Salesforce:

```bash
sf org login web
```

Check authenticated organizations:

```bash
sf org list
```

Retrieve metadata:

```bash
sf project retrieve start
```

Deploy metadata:

```bash
sf project deploy start
```

> The exact authentication and deployment commands may vary depending on the Salesforce project and target environment.

---

# 🧪 Testing Before Deployment

Before deploying changes, the application should be tested.

Testing includes:

* Apex Tests
* Functional Testing
* Integration Testing
* LWC Testing where applicable
* Permission Checks
* Deployment Validation
* Regression Testing

A deployment should not be considered successful only because the code worked in the developer environment.

---

# ⚠️ Deployment Dependencies

Salesforce applications consist of multiple connected components.

For example:

```text
LWC
 ↓
Apex Controller
 ↓
Custom Object
 ↓
Custom Fields
```

If a required dependency is missing from the target environment, deployment or application execution may fail.

Therefore, deployment should consider the **complete system and its dependencies**, not only individual files.

---

# 🌿 Git Merge Conflicts

A merge conflict can occur when two developers modify overlapping parts of the same file.

### Conflict Resolution Process

1. Identify the conflicting file
2. Understand both changes
3. Check the business requirement
4. Decide which implementation is correct
5. Resolve the conflict
6. Test the code
7. Commit the resolved changes

A conflict should not be resolved blindly because the correct solution depends on the intended business behaviour.

---

# ☁️ Salesforce Environments

## Sandbox

A Sandbox provides a separate Salesforce environment for development, testing or other purposes.

It allows developers to work without directly changing Production.

## Scratch Org

A Scratch Org is a temporary, source-driven Salesforce environment used for development and testing.

It supports reproducibility because the environment can be created from a defined project configuration.

---

# 🔄 Metadata vs Business Data

It is important to distinguish between Salesforce metadata and Salesforce data.

### Metadata

Examples:

* Objects
* Fields
* Apex Classes
* Triggers
* LWC
* Flows
* Configuration

### Business Data

Examples:

* Student records
* Job records
* Applications
* Employee records
* Leave requests

Metadata can be version-controlled and deployed.

Business data should not automatically be treated as source code.

---

# 🔐 Security Considerations

Sensitive information should never be committed to GitHub.

Do not store:

* Passwords
* Access tokens
* Client secrets
* API keys
* Authentication secrets
* Hard-coded credentials

Environment-specific configuration and credentials should be managed securely.

---

# 📋 Definition of Done

The Sprint 12 deployment exercise is considered complete when:

* [x] Git repository is created
* [x] Project structure is organized
* [x] Feature branch is used
* [x] Meaningful commits are created
* [x] Pull Request workflow is understood
* [x] Salesforce metadata is stored in source control
* [x] Salesforce CLI authentication is configured
* [x] Metadata can be retrieved
* [x] Metadata can be deployed
* [x] Apex tests can be executed
* [x] Target Salesforce org is verified
* [x] Deployment process is documented

---

# 🐛 Troubleshooting

## Salesforce CLI Not Recognized

If the `sf` command is not recognized, verify that Salesforce CLI is installed correctly and available in the system PATH.

## Wrong Salesforce Org

Before deployment, verify the authenticated organizations:

```bash
sf org list
```

Always confirm that the correct target org is selected before deployment.

## Deployment Failure

Check for:

* Missing metadata
* Missing dependencies
* Apex test failures
* Object or field dependencies
* Permission issues
* Configuration differences
* Integration configuration
* Environment-specific settings

---

# 💡 Key Engineering Principles

### 1. Source Control

The Salesforce org should not be treated as the only copy of the application.

### 2. Reproducibility

Another developer should be able to clone the repository and understand the project.

### 3. Controlled Deployment

Changes should move through controlled environments instead of being deployed directly without review and testing.

### 4. System Thinking

Deploy the complete system and its dependencies rather than thinking only about individual files.

### 5. Environment Awareness

Always verify which Salesforce org you are connected to before performing deployment operations.

---

# 🎓 Interview Questions Covered

### What is Git?

Git is a version-control system used to track changes and collaborate on software development.

### Why is Git important in Salesforce?

Git provides source control, history, collaboration, review and reproducibility for Salesforce development.

### What is a branch?

A branch provides an isolated place to develop changes safely.

### What is the difference between commit and push?

A **commit** records changes in the local Git repository.

A **push** sends those committed changes to the remote repository.

### What is a Pull Request?

A Pull Request is used to propose changes for review before merging them into another branch.

### What is Salesforce CLI?

Salesforce CLI is a command-line interface used to interact with Salesforce orgs and perform development tasks such as authentication, metadata retrieval and deployment.

### What is Salesforce metadata?

Metadata describes the structure and configuration of a Salesforce application, such as objects, fields, Apex, LWC and flows.

### What is a Sandbox?

A Sandbox is a separate Salesforce environment used for development, testing or other controlled activities.

### What is a Scratch Org?

A Scratch Org is a temporary, source-driven Salesforce development environment.

### What is a Changeset?

A Changeset is a Salesforce-native mechanism for moving metadata between related Salesforce orgs.

### What is Metadata API?

Metadata API provides programmatic mechanisms for retrieving and deploying Salesforce metadata.

### Why verify the target org before deployment?

To prevent accidentally deploying changes to the wrong Salesforce environment, especially Production.

### Why can deployment fail even if Apex is correct?

Because Salesforce components have dependencies. Missing objects, fields, permissions, configuration or other metadata can cause deployment or runtime problems.

---

# 🚀 Conclusion

Sprint 12 demonstrated the transition from simply building a Salesforce application to managing it as a software product.

The Placement Management System can now be managed using:

**Git → Branches → Commits → Pull Requests → Code Review → Testing → Salesforce CLI → Deployment → Documentation**

This sprint helped build an understanding of how Salesforce development can be performed using a professional, source-controlled and reproducible engineering workflow.

---

## 📚 Sprint Outcome

By completing this sprint, I gained practical understanding of:

* Git and GitHub
* Salesforce CLI
* Salesforce Metadata
* Source-driven development
* Branching
* Pull Requests
* Code Reviews
* Merge Conflicts
* Sandboxes
* Scratch Orgs
* Changesets
* Metadata API
* Deployment Dependencies
* Testing
* Controlled Deployment
* Repository Documentation
