# Week 2 — Distributed Tracing

<img src="assets/week2/welcome.png">

The good times continue!

This past week was a great dive into the world of troubleshooting and the importance of observability for us; software developers.

I started by learning about the three main observability pillars: metrics, traces, and logs. 

I gained a deeper understanding of how each of these pillars can provide valuable insights into the performance of software applications & help to identify and resolve issues quickly.

I succesfully setup CRUDDUR to four different observability tools: Honeycomb, AWS X-Ray, CloudWatch, and Rollbar.

Here is a brief on the tools, if you consider learning more.

|  Tools         | Description                                          |
|-------------| -----------------------------------------------------|
| [Honeycomb](#honeycomb-dive)   |  Honeycomb is a distributed tracing & observability platform to help engineers understand and debug complex systems. |
| [AWS X-Ray](#instrument-aws-x-ray)   |  AWS X-Ray is a tracing service provided by AWS that helps analyze and debug distributed applications.  |
| [CloudWatch](#aws-cloudwatch)  |Amazon CloudWatch is a monitoring and observability service provided by AWS |
| [Rollbar](#rollbar)  |Rollbar is a cloud-based error and log monitoring tool  helps identify software errors in real-time.  |


Through careful analysis of the data generated, I was capable to effectively identify and resolve numerous critical issues, allowing me to make data-driven decisions that led to real improvements in the performance and stability of the app.


There were two practices I was doing that are worth mentioning:

- **Instrumentation**, which is the practice of adding code to a software application in order to capture data about its performance or behavior, most onboarding to the tools was taking this putting that and troubleshoot in between.
- **Distrubuted Tracing**, it is a technique for tracking the path of a request as it flows through a distributed system or application.

In a distributed system, a single request can touch many different components, services, and systems, and tracking the path of that request can be challenging. This is what these tools can help us in achieving.


Very decent accumulated knowledge, and there is still more related to acquire. 

Take a look at the work completed thus far below!



# Honeycomb Dive


## A- Set Honeycomb API Env Var

```
export HONEYCOMB_API_KEY="Kk4cyhQ9zhCxNKg1BzyCyA"
```

```
gp env HONEYCOMB_API_KEY="Kk4cyhQ9zhCxNKg1BzyCyA"
```

<img src="assets/week2/heyhoney/1 set api key env var.png">

## B-Hard code Service Name  in docker compose

<img src="assets/week2/heyhoney/2- include api key and others requirement for honeycomb.png">

You may ask why not these and gg?

```
export HONEYCOMB_SERVICE_NAME="Cruddur" //cruddur Service name in span 
```

```
gp env HONEYCOMB_SERVICE_NAME="Cruddur"
```

:lamp: Because you dont want it to be consistent as your backend services may vary.


## C- Configure Open Telemetry to send for honeycomb

```
      OTEL_SERVICE_NAME: "backend-flask" 
```

Automatic Instrumentation isnt as good in the frontend.


#  Send Data to required backend lang  dependent

## 1-  Install your backend required language packages

go to backend

```
cd backend-flask
```

Run

```
pip install opentelemetry-api 
```
<img src="assets/week2/heyhoney/3 install required packages.png">

Include all the packages in requirement.txt
```
opentelemetry-api
opentelemetry-sdk 
opentelemetry-exporter-otlp-proto-http 
opentelemetry-instrumentation-flask 
opentelemetry-instrumentation-requests
```


Run requirement txt to get the packages installed since python isnt that good in package management ;)

```
pip install -r requirements.txt
```
<img src="assets/week2/heyhoney/4 installed them from txt file.png">


## 2- Initialize

add this to app.py

- This before main 

```
# HoneyComb things for reference 1-----
from opentelemetry import trace
from opentelemetry.instrumentation.flask import FlaskInstrumentor
from opentelemetry.instrumentation.requests import RequestsInstrumentor
from opentelemetry.exporter.otlp.proto.http.trace_exporter import OTLPSpanExporter
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor


# HoneyComb things for reference 2-----
# Initialize tracing and an exporter that can send data to Honeycomb
provider = TracerProvider()
processor = BatchSpanProcessor(OTLPSpanExporter())
provider.add_span_processor(processor)
trace.set_tracer_provider(provider)
tracer = trace.get_tracer(__name__)
```

A this should be after main `app = Flask(__name__)`


```
# HoneyComb things for reference 3-----
FlaskInstrumentor().instrument_app(app)
RequestsInstrumentor().instrument()
```

Instructed from:
<img src="assets/week2/heyhoney/6 proof init honeycomb instructions.png">

<img src="assets/week2/heyhoney/5 honeycomb init.png">

Making code explicit, env var are sneaky. 

Env var are technically easy but.


## D- Docker Compose up
No need to build the container, it will do it for us. Simple let the docker compose do the magic.

ERROR!

<img src="assets/week2/heyhoney/7- try to hit endpointERROR.png">



## Troubleshoot
<img src="assets/week2/heyhoney/8 troubleshoot solution.png">

added this 
```
# Show this in the logs within the backend-flask app (STDOUT)
simple_processor = SimpleSpanProcessor(ConsoleSpanExporter())
provider.add_span_processor(simple_processor)
```

and imported its librairy
```
from opentelemetry.sdk.trace.export import ConsoleSpanExporter, SimpleSpanProcessor
```

and then go try the endpoint once more


Oh it shows data now!
<img src="assets/week2/heyhoney/9 reloading data and getting some spans now.png">


## Honeycomb dont show?

- Check again

env | grep HONEY

It is there.


go to 

honeycomb-whoami.glitch.me to find out what api is that..

<img src="assets/week2/heyhoney/replace.png">

# Restart fresh
<img src="assets/week2/heyhoney/replace2.png">

<img src="assets/week2/heyhoney/12 update npm front.png">

## Let's automate this in gitpod
<img src="assets/week2/npm auto.png">

## And make ports unlocked by default in gitpod

<img src="assets/week2/related make port open by default in gitpod.png">



### Solved, here is the dashbaord showing data.

<img src="assets/week2/heyhoney/13- SOLVED! about honey dashboard.png">

# Observing 👀

<img src="assets/week2/heyhoney/14 honey queries.png">


<img src="assets/week2/heyhoney/15- HTTP status code.png">

<br>

<img src="assets/week2/heyhoney/16- bubble.png">

## Spans:

<img src="assets/week2/heyhoney/17 span sample.png">

## More Observability
<img src="assets/week2/heyhoney/18 daata set daily traffic.png">

<br>

<img src="assets/week2/heyhoney/19 HISTOIRY.png">

## I Added Spans:

- 1:Aquiring a tracer:


Go to an api endpoint like the home_activites.py endpoint & add this:

This will help using only the opentelemetryAPI, cause there is fat pack of import.

```
from opentelemetry import trace
tracer = trace.get_tracer("home.activities")
```
- 2: Creating Spans afte def run():

```
with tracer.start_as_current_span("home-activities-mock"):
```


add these after and align to identation to adding Attributes to Spans external-link

```
span = trace.get_current_span()
span.set_attribute("user.id", user.id())
```

<img src="assets/week2/heyhoney/20 two spans.png">

<br>

<img src="assets/week2/heyhoney/21 SPAN EXPAND.png">

## Advanced Visibility

#### Required code:
<img src="assets/week2/heyhoney/22 our field.png">

#### Output:
<img src="assets/week2/heyhoney/23 it see our field.png">


### Custom Queries & DB Calls

<img src="assets/week2/heyhoney/24 query eyyyey.png">

<br>

<img src="assets/week2/heyhoney/25 query p2.png">

This error happened cause i called the endpoint after running docker compose with python syntax missing identation:
<img src="assets/week2/heyhoney/26 takes me to this span where i had error cause i missed a python syntax.png">

<br>


<img src="assets/week2/heyhoney/27 another query.png">

<br>


<img src="assets/week2/heyhoney/28 another query.png">

## Dig deep with this feature and + 
<img src="assets/week2/heyhoney/29 another query but with zoom.png">



---

# Instrument AWS X-Ray

### Install AWS SDK


<img src="assets/week2/XRAY/1 isntall sdk.png">



## Create group

<img src="assets/week2/XRAY/2 json.png">

```
aws xray create-group \
   --group-name "Cruddur" \
   --filter-expression "service(\"backend-flask\")
```
<img src="assets/week2/XRAY/3 crfeate groip.png">



### Here it is

<img src="assets/week2/XRAY/4- Its here to group traces together..png">

## Sampling 

a good way to ask it to show you what you really need.

```
aws xray create-sampling-rule --cli-input-json file://aws/json/xray.json
```

<img src="assets/week2/XRAY/5 sample using json.png">

Create it using CLI using the xray.json

You can do it using aws console. However listen brother, UI changes json dont ;)

<img src="assets/week2/XRAY/6 the real 6.png">


### Set up the deamon

It is ca-central, i corrected it before commiting.
<img src="assets/week2/XRAY/7 add the daemon thanks andrew it was headache to get it as he said.png">

## Backend working:
<img src="assets/week2/XRAY/8 backend work doing good.png">

## Things are going succesfully to XRAY
<img src="assets/week2/XRAY/9 success deliver to xray.png">

## We have data:

<img src="assets/week2/XRAY/10  the real 10.png">

## Digging into XRAY specific request:
<img src="assets/week2/XRAY/11 more of XRAY.png">

## More:
<img src="assets/week2/XRAY/12 more.png">

## Overview:
<img src="assets/week2/XRAY/13 bye.png">

## Part 2 XRAY: Subsegmentation:

### Checking the connectivity:
<img src="assets/week2/XRAY/SUBSEG VIDEO/1 works hmmhmh.png">

## Service Map in AWS XRAY:
<img src="assets/week2/XRAY/SUBSEG VIDEO/2 service map.png">

## Metadata ERROR is not Big deal:
<img src="assets/week2/XRAY/SUBSEG VIDEO/3 meta data work dont really matter hm.png">

## Gaining more insights:
<img src="assets/week2/XRAY/SUBSEG VIDEO/4 getting more data.png">

## Mock data is there, success:

<img src="assets/week2/XRAY/SUBSEG VIDEO/5 before 5.png">
<img src="assets/week2/XRAY/SUBSEG VIDEO/5 mock data s here.png">

---


# AWS CloudWatch

## Installing the requried package:
<img src="assets/week2/Cloudwatch/1- install watchtower.png">

## Facing an error :
<img src="assets/week2/Cloudwatch/2 result in error because we have to pass it to it.png">

## Troubleshooting the error:
<img src="assets/week2/Cloudwatch/3 tried but still error.png">

## Solving the Error:

<img src="assets/week2/Cloudwatch/4 another error because it should be done instead.png">

## here:
<img src="assets/week2/Cloudwatch/6 should be working now.png">

## Dev Proof:


<img src="assets/week2/Cloudwatch/7 prrof.png">

## Cloudwatch Visual Proof:
<img src="assets/week2/Cloudwatch/8 log streams data.png">

## Cloudwatch is set to receive logs:
<img src="assets/week2/Cloudwatch/9 here it is.png">

---

# Rollbar

Rollbar is a great product indeed. Simply put it's a way to investigate any kind of error that can happen to the backend with further details.


## Install required packages:
<img src="assets/week2/rollbar/1 install rollbar required packages.png">

## Configure Rollbar Tokens:
<img src="assets/week2/rollbar/2 settin rollbar tokens.png">

## Sample verification page:
<img src="assets/week2/rollbar/3 rollbar checks.png">

# Listening:
<img src="assets/week2/rollbar/4 listitening.png">


## Seeing this page after clicking on Items is  good sign:
<img src="assets/week2/rollbar/5 WHEN U CLICK ON ITEMS AND FIND THIS ITS GOOD SIGN.png">

<br>

<img src="assets/week2/rollbar/6 here it is.png">

## The Hello World:
<img src="assets/week2/rollbar/7 view inside.png">

## Checking connection and trying things:
<img src="assets/week2/rollbar/7 zanother 7.png">

## Dashboard Overview:
<img src="assets/week2/rollbar/9 dashbaord.png">


---
# Week Three To-Do & Student Status

| Tasks                                             | Status |
|:---------------------------------------------------|:--------:|
| Watch Week 2 Live-Stream Video                    | ✅     |
| Watch Chirag Week 2 - Spending Considerations     | ✅     |
| Watched Ashish's Week 2 - Observability Security Considerations | ✅     |
| Instrument Honeycomb with OTEL                     | ✅     |
|Run queries to explore traces within Honeycomb.io|✅|
| Instrument AWS X-Ray                              | ✅     |
|Configure and provision X-Ray daemon within docker-compose and send data back to X-Ray API|✅|
|Observe X-Ray traces within the AWS Console|✅|
| Instrument AWS X-Ray Subsegments                   | ✅     |
|Install WatchTower & Onboard to Cloudwatch|✅|
| Configure custom logger to send to CloudWatch Logs |  ✅    |
| Integrate Rollbar and capture an error             |   ✅   |


---

# Homework Challenge & Student Status

|  Challenge                                                                                                   | Status |
|:----------------------------------------------------------------------------------------------------------------------|:--------:|
| Instrument Honeycomb for the frontend-application to observe network latency between frontend and backend[HARD]      |        |
| Add custom instrumentation to Honeycomb to add more attributes eg. UserId, Add a custom span                          |     ✅    |
| Run custom queries in Honeycomb and save them later eg. Latency by UserID, Recent Traces                              |     ✅    |
| Figure out how to do segment and sub-segment on AWS XRAY                                                               |     ✅    |
