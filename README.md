
# Craftista - The Ultimate Devops Learning App

We, at [School of Devops](https://schoolofdevops.com) take pride to introduce you to Craftista, a Polyglot, Micro-Services based application, built with the Modern Tech stack, specially designed to be used as a learning app to buid Devops Projects with.

## Demo Repository (If you just want to launch the app in 5 mins and play with it)
This project repo  is for builders who want to learn Devops by building projects from scratch. If you are looking for just launching this app in less than 5 minutes and playing around with it, head over to [Craftista Demo](https://github.com/craftista/craftista-demo) instead.


## What is Craftista: Celebrating the Art of Origami

Welcome to Craftista, a unique web platform dedicated to the beautiful and intricate world of origami. Craftista is a place where origami enthusiasts and artists come together to showcase their creations, share their passion, and engage with a like-minded community. Our platform allows users to explore a diverse range of origami art, vote for their favorites, and get inspired by the daily featured origami.

![Simple Design](docs/stage4-02.png)

### Features

**Origami Showcase**:

Discover a wide array of origami creations, ranging from traditional designs to contemporary art pieces. Each origami has its own story and charm, waiting to be unfolded.

**User Voting System**:

Participate in the community by voting for your favorite origami pieces. See what creations are trending and show your support for the artists.
Daily Origami Recommendation: Be greeted daily with a new origami masterpiece, handpicked to inspire and ignite your passion for paper folding.

**Origami of the Day**:

Learn more about origami artists, their work, and their journey into the world of paper art.

---


## The Architecture

Craftista is not just an origami platform; it's a demonstration of modern web application development and microservices architecture. It leverages multiple backend services, including:

![Craftista Architevture](docs/Craftista-Architecture-SchoolofDevops-CC-BY-NC-SA4.0.jpg "Craftista Architecture")

### Micro Service 01 - Frontend

**Purpose**:
Serves as the frontend, acts as a router, integrates with all other services renders the  Graphical Interface.

**Language**: Node.js

**Framework**: Express.js

**Why Express.js**:
Express.js is a widely adopted and highly versatile web application framework for Node.js, offering several compelling reasons for its use. Its simplicity and minimalistic design make it an excellent choice for both beginners and experienced developers. Express.js provides a robust set of features and middleware, enabling rapid development of web applications and APIs. It excels at handling routes, HTTP requests, and various response types, allowing developers to build scalable and efficient server-side applications. Additionally, its active community and extensive ecosystem of plugins and modules make it easy to integrate with databases, authentication systems, and other technologies, streamlining the development process. Express.js's performance and flexibility, combined with its supportive community, make it a go-to choice for building web applications and APIs in Node.js.

**Who uses Express.js:**
Uber, Netflix, PayPal, LinkedIn, Groupon, Mozilla, Trello, Stack Overflow, GitHub, Myntra, Zomato,Trivago


### Micro Service 02 - Catalogue

**Purpose:**
Manages the origami showcase, including origami details and images.

**Language:** Python

**Framework:** Flask

**Why Flask:**
Flask is a lightweight and highly flexible Python web framework, making it an attractive choice for web developers. Its simplicity and minimalist design offer a low learning curve, making it ideal for small to medium-sized projects or when you need to quickly prototype an idea. Flask allows developers the freedom to choose components and libraries, giving them control over the tech stack and allowing for greater customization. It's well-suited for building RESTful APIs and web applications due to its clean and intuitive routing system. Flask also benefits from a supportive community and extensive documentation, ensuring developers have access to valuable resources when facing challenges. Overall, Flask's simplicity, flexibility, and ease of use make it a compelling choice for Python developers looking to build web applications and APIs efficiently and with a high degree of control.

**Who uses Flask:**
Netflix, Reddit, Lyft, Airbnb, Pinterest, Twilio, LinkedIn, MIT, Uber, Dropbox, Whitehouse.gov, Coursera

#### Backing Service 01: catalogue-db
Phase 1 : JSON File
Phase 2 : MongoDB

###  Micro Service 03 - Voting

**Purpose:**
Handles the voting functionality, allowing users to vote for their favorite origami.
**Framework:** Spring Boot
**Why Spring Boot Framework:**
Spring Boot is a powerful and widely adopted Java-based framework that offers numerous advantages for developers. It excels in simplifying the development of production-ready, stand-alone, and enterprise-grade applications. One of its key strengths is convention over configuration, which significantly reduces boilerplate code and allows developers to focus on building features rather than dealing with infrastructure concerns. Spring Boot's comprehensive ecosystem provides support for various modules like data access, security, and messaging, simplifying integration with databases and third-party services. It also includes embedded servers, making it easy to deploy applications without the need for external web servers. Moreover, Spring Boot benefits from a vast and active community, ensuring access to extensive documentation and a wealth of resources. Overall, Spring Boot is a go-to choice for Java developers seeking rapid application development, maintainability, and scalability for a wide range of projects, from microservices to monolithic applications.
**Who uses Spring Boot:**
Adobe, Microsoft, Yelp, American Express, Intuit, Vimeo, SoundCloud

#### Backing Service 02 : voting-db
Phase 1 : H2
Phase 2 : PostgreSQL


###  Micro Service 04 - Recommendation

**Purpose:**
Selects and presents the daily origami recommendation.
**Language:** Golang
**Why Golang:**
Go, also known as Golang, is a programming language developed by Google. It has gained popularity for its simplicity, performance, and suitability for building scalable and concurrent applications. It's also a compiled language, which makes it more efficient than other languages.Many companies and projects around the world use Go in their tech stack. Golang's performance and flexibility make it a compelling choice for developers looking to build robust and reliable applications. Many DevOps tools are written in Go to take advantage of these benefits.
**DevOps tools written in Go:**:
Docker, Kubernetes, Prometheus, Terraform, Consul, Nomad, Packer, Vault, Grafana, etcd, Istio
**Who uses Go Lang:**
Google, Dropbox, Uber, Netflix, Twitch, Cloudflare, Heroku, X (Twitter), BBC


Each service is built using a different technology stack, showcasing polyglot persistence and diverse backend technologies.

---

## Why Craftista is the Perfect Learning App ?

### 01 - Real Life Like - Micro Services, Polyglot App:
Craftista is not your typical hello world app or off the shelf wordpress app used in most devops trainings. It is a real deal. If you look at the architecture and the services of Craftista App, it resembles a real life use case. It's a polyglot microservices based application, with multiple backend services, each with its own technology stack. You can think of it as a simplified version of a E-Commerce platform as it has the essential services such as a Modern UI written in Node.Js, a Product Catalogue Service, a Recommendation Engine and even a User Review App (Voting Service). When you are working with Craftista, it is as good as building a Real Life Project.


### 02 - Modern Tech Stack:
We have made deliberate efforts to choose the technologies commonly used by organisations across the globe to build modern applications which technology choice such as  Express.js Framework based off Node.js, Golang, Python Flask Framework and Java Based Spring Boot Framework.

### 03 - Simplified Design:
We have deliberately kept the design simple by removing a lot of additional services such as Shopping Carts, User Management, Payments Processing, Order Management to keep the scope of the project manageable. You will not get lost into the complexity of the architecture and get overwhelmed by the magnitute of services to work with. Yet it is still sophisticated enough for you to get a taste of a Real World Project.
![Simple Design](docs/stage4.png)


### 04 - Iterative, Expandable and Resilient:
One of the reasons why this is a perfect learning app is at no point in time you would feel that its not good enough. Unlike a Real World app, which needs many different servies, database backends to be configured in order to have the MVP working,  You deploy one service with Craftista, you have a working UI Framework, without any backend services or databases being involved. And when you deploy additional services iteratively, the page keeps on getting richer, making it a perfect sample app to work with.

![4 Stages of Deployment](docs/4stages.png)

### 05 - Displays Useful System Info:
While building Devops Projects, you are going to deploy this app in containers, take it to kubernetes, scale it and put it behind load balancers. When that happens, how do you get the feedback on if its running within a container or not? Wouldn't it be nicer to find out if its running within a Kubernetes Cluster or not ? How do you validate the Load Balancer is working (should show differnt hostnames/ips every time you refresh). Thats where we have added the Sytems Info section which shows you all this relevant data.


![System Info](docs/sysinfo.png)

### 06 - Ability to Show the Version:
While learning about Application Deployment and Release Engineeing, its important to visually see the versions of the apps being updated. In the real world application, its mostly about checking if the individual  new features have been deployed or not to see the changes. With our Sample App, everything is visible on the UI. To roll out a new version, all you need to do is bump up the version string, and trigger that rollout. Convenient, isn't it ?

![App Version](docs/version.png "App Version")

### 07 - Backend Service Status Dashboard:
No real world application shows the status of all the backend services on the frontend UI dashboard. Sure, they may have very sophisticated monitoring consoles with status dashboards built into it. However, when you are trying to learn about Devops, you neither have the team to do that work for you, nor have immediate resources to do it. In most cases, when you are getting started building skills, you may not have gotten to the monitoring setup yet. Our Backend Services Status dashboard, which is displayed right on the main UI, does a fantastic job to understand which services are available, and which are not. And its a great visual aid while you are learning and implementing technologies in iteration. Thats Perfect, I Say !

![Service Status](docs/servicestatus.png "Service Status")

### 08 - Incorporates Unit Tests  & Integration Tests:
If you pick the Sample App, most of those are created by the developers to learn a new language and are mostly of type "Hello World !". When you are learning about devops technologies and specially building Continuous Integration Pipelines, its all about setting up that automated process to provide continuous feedback. How this feedback is generated ? Well, a major component of that is test cases.  And with shift-left philosophy, it started with Unit Tests, and then Integration Tests and then you could keep on adding additional test scenarios. To help you setup real life like project, we have added the real unit tests as part of each of the micro services code. Look at the example below, which shows the unit tests for the Product Catalogue Service written in Python. Now, Ain't that real ?

![Unit Tests](docs/unit_tests.png)

### 09 Every Service with UI (including APIs):
While learning devops, its not the **real life** project that you need, its more like **real life like** one which would make it a perfect learning app. Why? Because, most of the backend APIs in real life do not provide you with the UI. You have to look at the API documentation, and start making calls acordingly even to check whether that service is available or not. Not our Perfect Learning App. With Craftista, we have built UI with even the API services. Look at an example here, which shows the Product Catalogue Service with its API. Yes ! Our experience of teaching thousands of professionals from the top companies of the world is real :)

![API Service](docs/api.png)

### 10 - Mono Repo Structure:
While there are different school of thoughts while maintaining the code base, we have decided to follow the monorepo structure. This is a very popular approach in the devops community. It has many benefits, such as, easier to maintain, easier to understand, and easier to scale. And the main reason why we have chosen it is its a slight bit trickier while working with Mono Repos to setup CI/CD Pipelines, to organise your devops your code etc. If you have done it with mono, you would find it breeze to adopt to multi repo structure anyways.

![Mono Repo](docs/monorepo.png)

---

## For Developers and DevOps Enthusiasts
Craftista serves as a perfect sandbox for developers and DevOps practitioners. The microservices architecture of the application makes it an ideal candidate for experimenting with containerization, orchestration, CI/CD pipelines, and cloud-native technologies. It's designed to be a hands-on project for learning and implementing DevOps best practices.

---

## Getting Started

### Prerequisites
- Docker and Docker Compose
- Task (Taskfile) - Install from [https://taskfile.dev](https://taskfile.dev)
- Node.js 18+ (for frontend development)
- Python 3.10+ (for catalogue service)
- Java 17+ (for voting service)
- Go 1.21+ (for recommendation service)

### Quick Start with Task

This project uses [Taskfile](https://taskfile.dev) for task automation. To see all available tasks:

```bash
task --list
```

#### Development Setup

1. Install dependencies for all services:
   ```bash
   task install
   ```

2. Run individual services in development mode:
   ```bash
   task frontend:dev      # Frontend on http://localhost:3030
   task catalogue:dev     # Catalogue API on http://localhost:5000
   task voting:dev        # Voting service on http://localhost:8080
   task recommendation:dev # Recommendation API on http://localhost:8081
   ```

3. Run tests for all services:
   ```bash
   task test:parallel
   ```

#### Docker Operations

Build Docker images for all services:
```bash
task docker:build:parallel
```

Build and run a specific service:
```bash
task frontend:docker:run
task catalogue:docker:run
```

Push images to registry (requires authentication):
```bash
task docker:push
```

### CI/CD with GitHub Actions

This project includes GitHub Actions workflows for automated testing and Docker image building:

- **Automatic Triggers**: Workflows run on push to `main` or `develop` branches
- **Path-based Execution**: Only affected services are built when changes are made
- **Multi-platform Builds**: Images are built for both `linux/amd64` and `linux/arm64`
- **Registry**: Images are pushed to GitHub Container Registry (ghcr.io)

#### Testing Workflows Locally with Act

You can test and run GitHub Actions workflows locally using [act](https://github.com/nektos/act):

```bash
# Install act
task act:install

# Build and push all images to registry
task act:build:all

# Test specific service workflow
task act:frontend
task act:catalogue
task act:voting
task act:recommendation

# Show all act commands
task act:help
```

#### Registry Authentication

To use images from GitHub Container Registry:

```bash
# Set your GitHub Personal Access Token
export CR_PAT=your_github_personal_access_token

# Login to GitHub Container Registry
echo $CR_PAT | docker login ghcr.io -u YOUR_GITHUB_USERNAME --password-stdin

# Or use the task command
task docker:login GITHUB_USERNAME=your_username
```

### Running with Docker Compose

Run all services together using Docker Compose:

```bash
# Run services using images from GitHub Container Registry (recommended)
# First, ensure you're logged in to the registry
task docker:login GITHUB_USERNAME=your_username
task docker:run:registry

# Run services using locally built images
task docker:run:local

# Standard docker-compose operations
task docker:compose:up      # Start all services
task docker:compose:down    # Stop all services
task docker:compose:logs    # View logs from all services
```

#### Complete Workflow Example

```bash
# 1. Clone the repository
git clone https://github.com/nerds-run/craftista.git
cd craftista

# 2. Set up authentication
export CR_PAT=your_github_personal_access_token
task docker:login GITHUB_USERNAME=your_username

# 3. Option A: Use pre-built images from registry
task docker:run:registry

# 3. Option B: Build and push your own images
task act:build:all        # Build and push using local GitHub Actions
task docker:run:registry  # Run the newly pushed images

# 4. Access the services
# Frontend: http://localhost:3030
# Catalogue API: http://localhost:5000
# Voting API: http://localhost:8080
# Recommendation API: http://localhost:8081

# 5. View logs
task docker:compose:logs

# 6. Stop services
task docker:compose:down
```

### Common Development Tasks

```bash
# Run linting for all services
task lint

# Clean all build artifacts
task clean

# Run specific service tasks
task frontend:test
task catalogue:format
task voting:build
task recommendation:lint

# Show all available tasks
task --list

# Show help for a specific namespace
task frontend:default
task catalogue:default
task voting:default
task recommendation:default
```

---
## 15 Project Ides to build using this Application Repo

Here are 10 basic projects you could build with it that would make you a Real Devops Engineer
  1.  Containerize with Docker: Write Dockerfiles for each of the services, and a docker compose to run it as a micro services application stack to automate dev environments.
  2.  Build CI Pipeline : Build a complete CI Pipeline using Jenkins, GitHub Actions, Azure Devops etc.
  3.  Deploy to Kubernetes : Write kubernetes manifests to create Deployments, Services, PVCs, ConfigMaps, Statefulsets and more
  4.  Package with Helm : Write helm charts to templatize the kubernetes manifests and prepare to deploy in different environments
  5.  Blue/Green and Canary Releases with ArgoCD/GitOps: Setup releases strategies with Argo Rollouts Combined with ArgoCD and integrate with CI Pipeline created in 3. to setup a complete CI/CD workflow.
  6.  Setup Observability : Setup monitoring with Prometheus and Grafana (Integrate this for automated CD with rollbacks using Argo), Setup log management with ELS/EFK Stack or Splunk.
  7.  Build a DevSecOps Pipeline: Create a DevSecOps Pipeline by adding SCA, SAST, Image Scanning, DAST, Compliance Scans, Kubernetes Scans etc. and more at each stage.
  8.  Design and Build Cloud Infra : Build Scalable, Hight Available, Resilience, Fault Tolerance Cloud Infra to host this app.
  9.  Write Terraform Templating : Automate the infra designed in project 8. Use Terragrunt on top for multi environment configurations.
  10.  Python Scripts for Automation : Automate ad-hoc tasks using python scripts.

and if you want to take it to the next level here are 5 Advanced Projects:

  1. Deploy on EKS/AKS: Build EKS/AKS Cluster and deploy this app with helm packages you created earlier.
  2. Implement Service Mesh: Setup advanced observability, traffic management and shaping, mutual TLS, client retries and more with Istio.
  3. AIOps: On top of Observability, incorporate Machine Learning models, Falco and Argo Workflow for automated monitoring, incident response and mitigation.
  4. SRE: Implement SLIs, SLOs, SLAs on top of the project 6 and setup Site Reliability Engineering practices.
  5. Chaos Engineering : Use LitmusChaos to test resilience of your infra built on Cloud with Kubernetes and Istio.

## Contributing
While we have attempted to make it a Perfect Learning App, and have got many things right, its still a work in progress. As we see more useful features from the perspective of learning Devops, we will continue to improve upon this work. We welcome contributions from the community! Whether you're an origami artist wanting to showcase your work, a developer interested in microservices, or just someone enthusiastic about the devops learning projects, your contributions are valuable. Check out our contributing guidelines(to be added) for more information. While we are writing the guidelines, feel free send us a pull request when you have something interesting to add.

## Attribution
This project is released under the Apache 2.0 License. If you use, modify, or distribute this project, you must retain the original license and give proper credit to the authors. Please include a reference to the original repository and authors: [[GitHub Repository URL](https://github.com/craftista)].

## License
Craftista is open-sourced under the Apache License 2.0.

## How to Get started with Devops Mastery ?
While you could take this application code to design and build devops projects yourself, you may benefit by going through a holistic, structured program which combines Courses and Labs with Projects, AI Strategies, Community, Coaching and Certification Prep. Thats what [Devops Mastery System](https://schoolofdevops.com/#why) created by Gourav Shah, Founder at [School of Devops](https://schoolofdevops.com/) is all about. Gourav is a leading Corporate Trainer on Devops, has conducted 450+ workshops for Top companies of the world, has been a course creator with Linux Foundation, is published on eDX and has tailor built this learning app himself. Get started with your journey to upScale your Career and experience the AI Assisted, Project Centric Devops Mastery System and by enrolling into our [Starter Kit](https://schoolofdevops.com/#starterkit).
