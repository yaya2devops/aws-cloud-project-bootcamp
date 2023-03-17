# Homework Tracker

As I proceed with my tasks, I will give priority to completing my homework and ensure that it is at the top of my to-do list.

> current catch - 17/03/2023

---


| Week 0 Challenges                                                                                        | Status |
|:----------------------------------------------------------------------------------------------------------|:--------:|
| Destroy your root account credentials, Set MFA, IAM role                                                |     ✅   |
| Review all the questions of each pillars in the Well Architected Tool (No specialized lens)             |     ✅   |
| Create an architectural diagram (to the best of your ability) the CI/CD logical pipeline in Lucid Charts |  ✅      |
| Research the technical and service limits of specific services and how they could impact the technical path for technical flexibility. |    ✅    |
| Open a support ticket and request a service limit                                                        |  ✅      |
|Use EventBridge to hookup Health Dashboard to SNS and send notification when there is a service health issue| ⌛|

---

|  Week 1 Challenges                                                        | Status |
|:---------------------------------------------------------------------------------|:--------:|
| Run the dockerfile CMD as an external script                                    |        ⌛|
| Push and tag a image to DockerHub (they have a free tier)                        |     ⌛   |
| Use multi-stage building for a Dockerfile build                                 | ⌛       |
| Implement a healthcheck in the V3 Docker compose file                            |    ⌛    |
| Research best practices of Dockerfiles and attempt to implement it in your Dockerfile |  ⌛      |
| Learn how to install Docker on your localmachine and get the same containers running outside of Gitpod / Codespaces |   ✅     |
| Launch an EC2 instance that has docker installed, and pull a container to demonstrate you can run your own docker processes. |     ⌛   |

---

|  Week 2 Challenges                                                                                                   | Status |
|:----------------------------------------------------------------------------------------------------------------------|:--------:|
| Add custom instrumentation to Honeycomb to add more attributes eg. UserId, Add a custom span                          |     ✅    |
| Run custom queries in Honeycomb and save them later eg. Latency by UserID, Recent Traces                              |     ✅    |
| Figure out how to do segment and sub-segment on AWS XRAY                                                               |     ✅    |
|Instrument Honeycomb for the frontend-application to observe network latency between frontend and backend  |⌛|
| [Events limits](assets/week2/pricing/README.md)|+|


---

|  Week 3 Challenges                                                                               | Difficulty | Status |
|---------------------------------------------------------------------------------------------------|------------|--------|
| Decouple the JWT verify from the application code by writing a Flask Middleware                  | Medium     |   ⌛     |
| Implement a Container Sidecar pattern using AWS’s official Aws-jwt-verify.js library             | Hard       |  ⌛      |
| Decouple the JWT verify process by using Envoy as a sidecar                                      | Hard       |       ⌛ |
| Implement a IdP login (e.g. Login with Amazon or Facebook or Apple)                               | Hard       |    ⌛    |
| Implement MFA that sends an SMS (text message) (Note: This may have additional costs)             | Easy       |   ⌛     |

