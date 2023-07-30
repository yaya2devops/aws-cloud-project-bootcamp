# Week 0 — Billing and Architecture

## Week Zero Main Tasks
- [Cloudnative Architectures](#cloudnative-architecture)
  - [Logical Design](#creating-logical-diagram)
  - [Conceptual Design](#creating-conceptual-design)
- [Security Considerations](#security-considerations)
  - [Applying MFA](#applying-mfa)
  - [Creating Admin IAM user](#iam-user)
- [Spending Considerations](#spend-considerations)
  - [Create a Billing Alarm](#create-billing-alarm-using-aws-cli)
  - [Create a Budget](#create-aws-budget-using-aws-cli)
- [Use CloudShell](#aws-cloudshell)
- [Generate AWS Credentials](#generate-aws-credentials)
- [Installed AWS CLI](#install-aws-cli)
   - [Setting SNS](#setting-sns)
- [Contact AWS Support](#open-support-ticket)
- [AWS CLI Auto Prompt](#aws-cli-auto-prompt)
- [Design CI/CD Pipeline](#creating-cicd-flow-for-week-9)
- [EventBridge Health Dashboard](#hookup-health-dashboard-to-sns-using-eventbridge)
---

# A Path Towards Modern Solutions

A monolithic architecture is a traditional way of designing and developing apps. In a mono-based architecture, all of the application's code and data are contained in a single codebase. 

- **It is difficult to develop**. Because all of the code and data are in a single codebase, not practical to track changes and make updates which lead to errors and bugs.
- **It is difficult to deploy**. The entire application is deployed as a single unit, when you deploy changes to the application you can affect other parts of the application.
- **It is difficult to scale**. If the application experiences increased traffic, it can be difficult to scale the application without targeting performance.

In addressing the challenge at hand, a profound and enduring resolution emerged - the adoption of a cloud-native architecture. 

This forward-thinking approach harnessed the power of cloud technologies to reshape the very fabric of our systems, opening up a world of possibilities and transformative potential


## Build Scalable and Resilient Applications

**Cloud-native architecture** is a design methodology that utilizes cloud services to allow dynamic and agile application development techniques that take a modular approach to building, running, and updating software through a suite of cloud-based microservices versus a monolithic application infrastructure.

Before the release of the app, cloud architects typically follow these steps to ensure its successful implementation.

1. ***Define the project goals***<br>
The first step towards great cloud-native architecture is the discussions with both the technical and business team to ensure that the project's objectives are met in its entirety. It is also important to consider the risks, assumptions, and constraints that may be involved in the project.
2. ***Design the architecture***<br>
This step involves breaking down the application into microservices, which are small, independent services that can be developed, deployed, and scaled independently. The microservices should be designed to be loosely coupled and scalable.
3. ***Implement the microservices***<br>
Developing the microservices using a variety of technologies and deploying them to the cloud. The cloud platform e.g AWS will provide the infrastructure for running the microservices and managing their scaling.<br>
The µservices can be developed using a variety of technologies e.g. as Java, Go, or **Python our case**.
4. ***Test and deploy the application***<br>
The final step (stating point) is to test and deploy the application. This involves testing the microservices individually and then testing the application as a whole.

| Goals                            |   Evidence     |
|----------------------------------|--------|
| Define the project goals         |   [Project Scenario](resources/project-scenario.md)      |
| Design the architecture          |  [❗Architectures ](#types-of-architectural-diagrams)     |
| Implement the microservices      |  [Code Structure](../backend-flask/services/)      |
| Test and deploy the application  |  [W1 using Docker](week1.md)    |

This project application is constructed upon this robust architecture, and we have committed to accomplishing each step outlined above. 

## The Fundamental Pillars of Project Management
In the realm of project management, certain key factors play a pivotal role in shaping the destiny of any endeavor. 

***The Iron Triangle*** is a project management concept that refers to the three constraints that are commonly considered to be the most important in determining the success or failure of a project. 

**The three constraints are,**

| Constraint | Description |
|---|---|
| **Time** | Refers to the amount of time available to complete a project. The project needs to be completed within a specific timeframe, and any delays can have a significant impact on the project's success. |
| **Cost** | Refers to the budget available to complete a project. The project needs to be completed within the allocated budget, and any cost overruns can have a significant impact on the project's success. |
| **Scope** | Refers to the goals, deliverables, and features of a project. The project needs to meet the agreed-upon scope, and any changes or deviations from the scope can have a significant impact on the project's success. |

**Benefits of the Iron Triangle**

The Iron Triangle provides several benefits for project managers, including:

* It helps to ensure that projects are completed on time, within budget, and with the agreed-upon scope.
* It provides a framework for making decisions about project trade-offs.
* It helps to identify and manage risks.
* It provides a common language for communicating with stakeholders.

**How to Use the Iron Triangle**

The Iron Triangle can be used to manage projects by following these steps:

1. Identify the three constraints for your project.
2. Set realistic expectations for each constraint.
3. Monitor the constraints throughout the project.
4. Make trade-offs as needed to ensure that the project is completed successfully.

**Additional Considerations,**

| Concept | Description | Examples |
|---|---|---|
| **Risks** | Events that could happen and have a negative impact on the project | Late delivery, user commitment, technical problems |
| **Assumptions** | Things that we believe to be true but that haven't been proven | The budget being approved, sufficient network bandwidth, the availability of key resources |
| **Constraints** | Limitations that the project must adhere to | Time, budget, technical requirements |

Understanding the three constraints and how they interact, also the assumptions and the risks project managers can increase their chances of success.


## Develop a Common Dictionary

- **Ask questions** — Don't be afraid to ask questions, even if you think they're obvious. This will help to ensure that everyone is on the same page.
- **Play "be-the-packet"** — This exercise can help you to understand how data is transmitted through the network.
- **Document everything** — This includes both technical and non-technical documentation.

**By doing so, you can achive the following :==).**

- *Prevents misunderstandings*<br>
Everyone will be using the same terminology, so there will be no confusion about what different terms mean.
- *Makes communication easier* <br>It will be easier for people to understand each other and to collaborate on projects.
- *Improves the quality of the product* <br>When everyone is on the same page, the product will be more likely to be successful.
How to Overcome Challenges

Lastly. Be patient. It takes time.<br>
Be consistent and use the same terminology throughout the project and be willing to compromise. 

Not everyone will agree on everything, but it's important to find common ground.



# Types of Architectural Diagrams

Architectural diagrams are visual representations of a software system's architecture. They are used to communicate the system's design to stakeholders, and to help developers understand how the system works.

There are three main types of architectural diagrams:


- **Conceptual diagrams (aka napkin designs)** provide a high-level overview of the system. They show the system's major components and how they interact.



- **Logical diagrams (aka blueprints)** show the system's functionality in more detail. They show how the system's components interact, and how data flows through the system.


- **Physical diagrams** show the physical components of the system, such as hardware, software, and networks. They show how these components are connected, and how they interact with each other.

Each type of architectural diagram has its own purpose, and they are often used together to provide a complete picture of the system's architecture.

### **When to Use Each Type of Architectural Diagram**

- **Conceptual diagrams** are used early in the development process, when the system's requirements are still being defined. They are a quick and easy way to communicate the overall idea of the system to stakeholders.
- **Logical diagrams** are used later in the development process, when the system's functionality is being designed. They are a more detailed way to communicate the system's design to developers.
- **Physical diagrams** are used in the final stages of development, when the system is being implemented. They are a way to communicate the system's design to system administrators and other technical staff.

Architectural diagrams are a valuable tool for communicating the design of a software system. They really can be used to expand your vision to whoever. 

### How to Create an Architectural Diagram
here are many different tools that can be used to create architectural diagrams. I personally like first two!

- Lucidchart (Paid)
- draw.io (FREE)
- Microsoft Visio (Paid)

I used **Draw.io** extensively in weeks 5, 6, 7,8 and 9. 

In week 10, you'll also find CloudFormation architectures *I* built using **Lucidchart**, which highlights the potential differences. <br>Logic, comparing a free product and a paid one.

In Lucidchart, you can conveniently access built-in shapes by navigating to "File" → "Import Data," making it an ideal platform for working with AWS-related projects.
- Here is a [DRAWIO Sample.](https://raw.githubusercontent.com/yaya2devops/aws-cloud-project-bootcamp/main/journal/assets/week9/CI-CD-Architect/ci-cd-architect.png)
- Here is [Lucidchart Sample.](https://raw.githubusercontent.com/yaya2devops/aws-cloud-project-bootcamp/a22ddff9354e1ad1b680ed92383f5b0430d4f608/journal/assets/week11/big-bundle/0-App-Network-Buleprint.svg)

<img src="assets/week0/media/use-aws-shapes-inlucid.png">

Find additional [diagramming tools, and AWS icons.](https://aws.amazon.com/fr/architecture/icons/) 

### **⚡Get started Now**
If budget is a concern, I highly recommend starting with Draw.io.<br>
There's even an [extension available in VS Code](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio) for you to design directly from your favorite IDE. 

I have included all the extensible files for your convenience. e.g. visit [week 8.](week8.md)<br>
Meaning, you can easily begin by importing one of my architecture files to DRAWIO and make edits on top. 

Happy diagramming!



### Creating **Logical Diagram**
Logical diagrams are more detailed than conceptual diagrams. They show how the system's components interact, and how data flows through the system. Logical diagrams are often used to communicate the system's design to developers.

- **System architecture:** The system will be a three-tier architecture, consisting of a presentation layer, a business logic layer, and a data access layer.<br>
- **Data flow:** The data flow will be unidirectional, with users entering data into the presentation layer, which will then pass the data to the business logic layer for processing. 

The business logic layer will then pass the data to the data access layer for storage.

<img src="assets/week0/media/logical-design.png">

This also effectively showcases the diverse components comprising the Cruddur product ecosystem.

## Creating **Conceptual Design**

Overall idea and scope to create a system that will allow users to share information and collaborate on projects. Conceptual diagrams are often drawn on napkins or whiteboards, hence the nickname "napkin designs.


With genuine enthusiasm and a touch of artistic flair, I created this captivating design, delicately sketching every stroke with two pens - one dipped in serene blue and the other ablaze with passionate red. We hope you like it!

I ensured that the architecture was designed with the following key features in mind:
- Secure Platform: considering Security best practices (refer to Journal).
- Robust Data Storage System: A reliable and scalable data storage system was integrated.

<img src="assets/week0/Cruddur-Architecture/cruddur-architecture.jpg">

When designing, the following constraints were also put forward.
- The system must be scalable to accommodate a large number of users.
- The system must be affordable to operate with costs considerations (refer to Journal).

I believe you'll greatly appreciate my design, so I've provided it in [PDF format](assets/week0/Cruddur-Architecture/cruddur-architecture.pdf) for your convenience and enjoyment.

<details>

<summary> More! Behind the scenes </summary>

<img src="assets/week0/Cruddur-Architecture/behind-the-scene.jpg">
</details>

## **Creating CI/CD Flow**

Outlined below is the CI/CD pipeline I have designed, which aims to automate the process of code integration, testing, and deployment. This pipeline fosters collaboration and accelerates the delivery of high-quality software, facilitating a more responsive development environment.

- Developer commits code to GitHub repository.
- AWS CodePipeline is triggered.
- The pipes are stored in the S3 pipeline bucket.
- Code changes are retrieved from AWS CodeCommit and passed to AWS CodeBuild.
- CodeBuild compiles and builds the application artifacts.
- AWS CodeDeploy deploys the artifacts to the target environment.

<img src="assets/week0/media/CICD-Arch.png">

Week zero marked the initial phase of our journey towards establishing robust DevOps and CI/CD pipelines. 

The real progress and significant advancements were witnessed [during week 9](week9.md). <br>Throughout this, we delved deep into the realm of DevOps and CI/CD pipelines, where the focus shifted from theoretical concepts to hands-on implementation and real-world application.

Kindly [direct your attention to week nine](week9.md), also find belown lucidchart architectures.
- [Twitter System Architecture](https://lucid.app/lucidchart/3dd58bb4-27dc-440d-9dc0-9bcd0154a346/edit?viewport_loc=224%2C471%2C1939%2C867%2Cu~1sbYNXU9q3&invitationId=inv_b811bc56-a51b-4481-a306-2f347e725dc5)
- [Diagrams Design](https://lucid.app/lucidchart/f03569ad-27eb-435d-a81e-4c0d404e5951/edit?viewport_loc=-513%2C135%2C2720%2C1216%2CwcSxugjtXe~j&invitationId=inv_d8a1495b-87a4-4031-80bf-08a7067c8e12)



# Frameworks for Efficient Design
Frameworks are a valuable tool for any designer, architect or a *technologist*. 

Frameworks are essential for reducing complexity, minimizing errors, and making the design process more efficient. 

Frameworks provide a common language and methodology for teams to follow, which can help to ensure that everyone is on the same page and that the final product meets the desired requirements.


## The Open Group Architecture Framework
TOGAF is a widely used framework for enterprise architecture. It provides a comprehensive set of tools and techniques for designing, implementing, and managing enterprise architecture. TOGAF is structured into four main components:


- A**rchitecture Development Method:** A systematic approach to creating and implementing enterprise architecture.
- **Enterprise Continuum:** A classification scheme for organizing architecture artifacts.
- **Architecture Content Framework:** Defining the necessary skills, processes, and tools for efficient enterprise architecture development and management.
- **Architecture Capability Framework:** Establishing the core content of enterprise architecture.


## Paving the Way for Robust Systems
Emphasizing six critical pillars, the AWS Well-Architected Tool fosters the creation of highly reliable, secure, performant, and cost-efficient systems, while enabling agile responses to changing market trends and customer needs. 

**These pillars are,**

| Pillar | Focus |
| --- | --- |
| Operational Excellence | Utilizing a fully automated operations pipeline for IT operations |
| Security | Ensuring that security accounts are always up to date |
| Reliability | Building highly reliable systems that self-heal and recover quickly |
| Performance Efficiency | Ensuring that systems are running at peak performance efficiently |
| Cost Optimization | Reducing costs by utilizing cost optimization principles |
| Business Agility | Enabling rapid responses to changing customer requirements and market trends |



## Empowering Design with AWS Well-Architected Framework

The AWS Well-Architected  can be used to assess the current state of your applications and to identify areas where you can improve your architecture. The tool also provides recommendations for how to improve your architecture.


The AWS Well-Architected Framework incorporates a set of insightful questions aligned with the aforementioned pillars of the well-architected approach. Based on the inputs provided, the framework generates a comprehensive report, aiding businesses in achieving optimal and sustainable design outcomes.

Based on these inputs, a report will be prepared in the end:

<img src="assets/week0/media/aws-arch-frame-service.png">



***aws***
:  Is a term I use before a name to refer the act of searching a service in the console.


To get started, from the console aws `AWS Well-Architected`.

## Unveiling the Application Layers
An application layer is a software layer that provides a set of services for the application. The application layer is responsible for interacting with the user, processing business logic, and accessing data.

**The application layer is typically divided into three sublayers,**

- **User interface layer:** The user interface layer is responsible for interacting with the user. It provides a way for the user to input data and view output.
- **Business logic layer:** The business logic layer is responsible for processing business logic. It implements the rules and procedures that define the application's functionality.
- **Data access layer:** The data access layer is responsible for accessing data. It provides a way for the application to store and retrieve data from a database or other data source.

The application layer is a critical part of any software application. 

The application layer should be well-designed, well-implemented, and well-tested to ensure that the application is reliable and secure.

---
# ———To Be Continued————
---