# Week 2 — Distributed Tracing
Awareness continues with another productive week. The past days was a great dive into the world of observability. <br>We successfully setup Cruddur to four different observability tools.


## Week Two Main Tasks
- [Observability](#observability)
  - [Why Observability Matters](#why-observability-matters)
  - [Instrumentation and Observability](#instrumentation-and-observability)
  - [Monitoring in Observability Ecosystem](#monitoring-in-observability-ecosystem)
  - [Distrubuted Tracing](#distrubuted-tracing)
  - [Observability on AWS](#observability-on-aws)
- [Open Telemetry with Honeycomb](#open-telemetry-with-honeycomb)
  - [Product Setup](#setup)
  - [Spans and Traces in OTEL](#spans-and-traces-in-open-telemetry)
  - [Heatmap in Honeycomb](#heatmap-in-honeycomb)
- [Onboard AWS X-RAY](#onboard-aws-x-ray)
  - [AWS X-Ray SDK](#installing-the-aws-x-ray-sdk)
  - [Instrumenting with X-ray](#instrumenting-your-application)
  - [Running the X-Ray daemon](#running-the-x-ray-daemon)
  - [X-RAY Daemon as Service](#x-ray-daemon-as-service)
  - [Traces as Groups in X-Ray](#traces-as-groups-in-x-ray)
  - [Sampling Rule in AWS X-RAY](#sampling-rule-in-aws-x-ray)
  - [X-Ray Subsegmentation](#x-ray-subsegmentation)
- [Spend Considerations](#spend-considerations)

# Observability

Before delving into distributed tracing, it is crucial to grasp the broader concept of observability.  The last refers to the ability to understand the state of a system by collecting and analyzing data from its different sources. 

It became increasingly difficult to track the state of the system by looking at individual components in the world of containers.
Observability were invented because we needed a way to understand the state of complex systems. 

### Why Observability Matters
Observability can help you reduce alert fatigue by providing you with a holistic view of your system. This means that you can be alerted to problems only when they are actually happening, rather than being bombarded with alerts that are not relevant.


The three pillars of observability are,
- **Metrics:** Metrics are numerical measurements of the state of a system. They can be used to track things like CPU usage, memory usage, and database queries.
- **Logs:** Logs are records of events that occur in a system. They can be used to track things like errors, exceptions, and unusual activity.
- **Traces:** Traces are records of the path of a request through a distributed system. They can be used to track things like performance bottlenecks and errors.

Observability can help developers make better decisions and It can be used as a whole for the following main reasons

- **Identifying performance bottlenecks:** By tracking metrics, you can identify the parts of your system that are using the most resources. This can help you to identify performance bottlenecks and optimize your system for performance.
- **Troubleshooting errors:** By tracking logs, you can identify the source of errors in your system. This can help you to troubleshoot errors and resolve them quickly.
- **Improving reliability:** By tracking traces, you can identify the path of requests through your system. This can help you to improve the reliability of your system by identifying potential problems before they cause outages.

## Instrumentation and Observability

Instrumentation is the process of adding code to a system to collect data about its behavior. This data can then be used to monitor and troubleshoot the system.

As will explained below, onboarding to the tools was exactly that, taking this putting that and troubleshoot in between.

The different types of data that can be collected through instrumentation are indeed the three pillars of observability mentioned above.

Here are some of the tools that you can use to instrument your system:
* **OpenTelemetry:**  an open-source instrumentation framework that can be used to collect metrics, logs, and traces from a variety of systems.
* **Application Performance Monitoring tools:** APM tools are commercial tools that can be used to collect metrics, logs, and traces from a variety of systems.

The best tool for you will depend on the specific needs of your system.

## Monitoring in Observability Ecosystem
Monitoring is a necessary part of observability, but it is not sufficient.

Observability requires a holistic understanding of the system, which can be achieved by collecting data from different sources not just from Metrics. 

**In other words, monitoring is about **knowing what** is happening in a system, while observability is about **understanding why** something is happening.**

| Feature | Observability | Monitoring |
|---|---|---|
| Purpose | Understanding the state of a system | Identifying problems |
| Data sources | Metrics, logs, traces | Metrics |
| Goal | Understanding the why | Understanding the what |
| Approach | Holistic | Focused |
| Tools | Distributed tracing, logging, metrics | Monitoring tools |

**Observability is a broader concept than monitoring, and it can be used to achieve a wider range of goals. However, monitoring is a necessary part of observability, and it can provide valuable insights into the state of a system.**

## Distrubuted Tracing

Distributed tracing is a *natural extension* of observability.

Distributed tracing is a type of trace that records the path of a request through a distributed system. It is a powerful tool that can help you to identify performance errors and other problems. It can also help you to troubleshoot problems and to improve the reliability of the system.

Core components that make it are below.

- **Trace:** a collection of spans that represent the path of a single request through a distributed system.
- **Span:**  a unit of work within a trace. It represents a specific event or operation that occurred during the processing of a request.
- **Context propagation:** the process of passing a trace identifier from one service to another as a request is processed. This allows the different services to associate their spans with the same trace.
- **Instrumentation libraries:**  used to instrument applications so that they can generate spans. These libraries typically provide APIs that allow developers to tag spans with metadata, such as the name of the service, the operation, and the start and end time.
- **Tracing data collectors:** Tracing data collectors are used to collect spans from the different services in a distributed system. These collectors typically store spans in a database or other persistent storage.
- **Tracing data visualizers:** Tracing data visualizers are used to visualize traces. These tools allow developers to see the path of a request through a distributed system and to analyze the performance and reliability of the system.

## Observability on AWS
AWS provides a comprehensive set of services and tools to help you achieve observability for your applications and services.

Some of the key AWS services and tools for observability include:

* **Amazon CloudWatch:** CloudWatch is a monitoring service that provides you with a central place to collect and store metrics, logs, and traces from your AWS resources.
* **Amazon X-Ray:** X-Ray is a distributed tracing service that helps you to understand the path of a request through your distributed system.
* **AWS Distro for OpenTelemetry:** OpenTelemetry is an open-source instrumentation framework that can be used to collect metrics, logs, and traces from a variety of systems.
* **AWS Distrokit:** Distrokit is a collection of open-source tools that can be used to instrument and monitor your applications.

This week, we will focus on the successful onboarding process of both *AWS CloudWatch and X-Ray*, allowing us to gain valuable insights from both services. Including the two external products, *Rollbar and Honeycomb*.

|  Tools         | Description                                          |
|-------------| -----------------------------------------------------|
| [Honeycomb](#open-telemetry-with-honeycomb)   |   distributed tracing & observability platform to help understand & debug complex systems. |
| [AWS X-Ray](#onboard-aws-x-ray)   |   tracing service that helps to analyze & debug distributed applications.  |
| Cloudwatch |monitoring and observability service.   |
| Rollbar  | cloud-based log monitoring tool helps to identify software errors in real-time.  |

## Spend Considerations
**Note:** The free tiers for these tools may change over time. Please check the individual tool's website for the most up-to-date information.

| Tool | Free Tier | Paid Tier |
|---|---|---|
| Honeycomb | **20,000,000 events notifications per month** | Starts at \\$0.00025 per event |
| Rollbar | **5,000 free events per month** | Starts at \\$0.02 per event |
| AWS X-Ray | **100,000 traces recorded, 1M traces scanned or retrieved per month** | Free with AWS | **There are additional charge for sampling.** |
| Amazon CloudWatch | **10 Custom Metrics and 10 Alarms** | Free with AWS  |

### Additional Costs Considerations

**Honeycomb**<br>
Honeycomb provides OpenTelemetry support, activity + team history, query result permalinks, and Honeycomb metrics to help you troubleshoot problems, understand how your application is being used, and track your application's performance.

**Rollbar**<br>
Rollbar is a powerful observability tool that provides unlimited users and projects, 2FA and encryption at rest, real-time feed and alerts, intelligent error grouping, stack traces and telemetry, deploy and version tracking, people tracking, Rollbar Query Language (RQL), and 30 days data retention.

**AWS XRAY**<br>
There are additional charge for sampling.

| Feature | Free tier | Pay-as-you-go | Reserved capacity |
|---|---|---|---|
| Traces recorded | 100,000 | \$0.00001 per trace | \$0.000007 per trace |
| Traces scanned or retrieved | 1,000,000 | \$0.00001 per trace | \$0.000007 per trace |
| Trace data stored | 1 GB | \$0.00003 per GB per month | \$0.00002 per GB per month |

**Amazon CloudWatch**<br>
Amazon CloudWatch is a monitoring and observability service that provides metrics, logs, and events for AWS resources and applications, with a free tier that includes 1,000,000 API requests, 5GB of log data ingestion and 5GB of log data archive, and 3 dashboards with up to 50 metrics each per month.

## Open Telemetry with Honeycomb

Allow me to serve as your knowledgeable guide, leading you through a meticulously structured journey of discovery and enhancement. 

### OpenUp to OpenTelemetry
**Telemetry** refers to the process of collecting and transmitting data from remote or inaccessible locations to a central location for analysis, monitoring, or control. 


On the other hand, **OpenTelemetry** is an open source project governed by the CNCF and was originally created by Google and Jaeger, but it has since been adopted by a wide range of organizations, including Microsoft, AWS, and Red Hat. 


**OpenTelemetry** is a set of tools, APIs, and SDKs that allow you to collect telemetry data from your applications. **Telemetry data** includes things like performance and the three key pillars and can be used to collect telemetry data from a wide variety of languages and frameworks e.g *Python* for our case.

**Honeycomb** is a cloud-native observability and monitoring platform that fully supports and leverages the OpenTelemetry project.

#### **Setup**

Head over honeycomb.io and sign up and retrieve the api key.
1. Create an environment.
2. Export your environment API key and service name to Gitpod.
```sh
export HONEYCOMB_API_KEY="<api-key>"
export HONEYCOMB_SERVICE_NAME="<service-name>"
```
3. Make the variables locked in your environement
```sh
gp env HONEYCOMB_API_KEY="<api-key>"
gp env HONEYCOMB_SERVICE_NAME="<service-name>"
```
4. Set the environment variables in `docker-compose.yml` under backend.
```yaml
OTEL_SERVICE_NAME: "backend-flask"
OTEL_EXPORTER_OTLP_ENDPOINT: "https://api.honeycomb.io"
OTEL_EXPORTER_OTLP_HEADERS: "x-honeycomb-team=${HONEYCOMB_API_KEY}"
```

#### **Instrumentation**

1. Add these packages to `requirements.txt` and run `pip3 install -r requirements.txt`.
```txt
opentelemetry-api 
opentelemetry-sdk
opentelemetry-exporter-otlp-proto-http
opentelemetry-instrumentation-flask
opentelemetry-instrumentation-requests
```
<img src="assets/week2/heyhoney/3honey.png">

2. Add these import statements in `app.py`.
```py
from opentelemetry import trace
from opentelemetry.instrumentation.flask import FlaskInstrumentor
from opentelemetry.instrumentation.requests import RequestsInstrumentor
from opentelemetry.exporter.otlp.proto.http.trace_exporter import OTLPSpanExporter
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor
```
3. Set up tracing and an exporter that can send data to Honeycomb just below all the import statements.

`OTLPSpanExporter()` reads the Honeycomb environment variables.
```py
provider = TracerProvider()
processor = BatchSpanProcessor(OTLPSpanExporter())
provider.add_span_processor(processor)
trace.set_tracer_provider(provider)
tracer = trace.get_tracer(__name__)
```
4. Initialize automatic instrumentation with Flask

Add this below `app = Flask(__name__)`.
```py
FlaskInstrumentor().instrument_app(app)
RequestsInstrumentor().instrument()
```

<img src="assets/week2/heyhoney/5 honeycomb init.png">

After a successful setup, the application should start providing data to the platform.

<img src="assets/week2/heyhoney/13- SOLVED! about honey dashboard.png">


### Spans and Traces in Open Telemetry
* A span is a unit of work that is executed within a trace. Spans are used to track the execution of your application, and they can be used to collect performance data, identify bottlenecks, and troubleshoot problems.

* A trace is a collection of spans. Traces are used to track the flow of execution through your application. They can be used to identify the root cause of problems, and they can be used to visualize the performance of your application.

When traces are sent to Honeycomb, the name of the Tracer is turned into the library.name field, which can be used to show all spans created from a particular tracer.

#### **Adding spans and attributes to tracers**

To create a span, you need to get a Tracer. A Tracer is a factory for creating spans. When you create a Tracer, you need to give it a name as a string. This string is the only required parameter.

Once you have set up tracing, you can add spans and attributes to tracers. A span is a unit of work that is executed within a trace. An attribute is a piece of data that can be attached to a span.

To add a span and attribute to a tracer, you can refer to the following.

1. create a trace and include a name
```py
from opentelemetry import trace
tracer = trace.get_tracer("home.name.tracer")
```
2. Inside the class, Create a span and name it. This is used to initiate a new span.

```py
class HomeActivities:
  def run():
    with tracer.start_as_current_span("home-activities-mock-data"):
```
3. Allow access to the current active span:
```py
      span = trace.get_current_span()
```
4. Implement additional tracing and metadata capabilities
```py
      now = datetime.now(timezone.utc).astimezone()
      span.set_attribute("app.now", now.isoformat())
      span.set_attribute("app.result_length", len(results))
```

In the grand scheme of this crafted code, the implementation will take this form.

```py
from opentelemetry import trace
tracer = trace.get_tracer("home.activities")

class HomeActivities:
  def run():
    with tracer.start_as_current_span("home-activities-mock-data"):
      span = trace.get_current_span()
      now = datetime.now(timezone.utc).astimezone()
      span.set_attribute("app.now", now.isoformat())
      span.set_attribute("app.result_length", len(results))
```

In this code, we are creating a span named `home-activities-mock-data` and setting an attribute named `app.now`. The value of the attribute is the current time, as returned by the `app.now()` function.

Once we have added a span and attribute to a tracer, we can view them on the Honeycomb website. 

To do this, you need to launch the app and browse the backend endpoint of `/api/activities/home`. <br>
The traces will be displayed.

<img src="assets/week2/heyhoney/21 SPAN EXPAND.png">


To retrieve specific data such as "app.now" and "app.result_length," all you need to do is select the desired span and use the search functionality by typing "app." on the current page. 

<img src="assets/week2/heyhoney/23 it see our field.png">


You can also test the real-time functionality of the app by intentionally introducing an error. 

For example, this error occurred because I called the endpoint after running Docker Compose with a Python syntax error due to missing indentation:


<img src="assets/week2/heyhoney/26 takes me to this span where i had error cause i missed a python syntax.png">


### Heatmap in Honeycomb

Heatmap is a graphical representation of data that provides a visual overview of the distribution and density of events over a specified period. It  displays aggregated metrics related to service performance, request latency, error rates, or other custom attributes. 

1. Open the menu on Left-Hand Side and select "New Query" to start building a new query.
2. In the query editor, set the visualization options to `HEATMAP(duration_ms)` and `"P90(duration_ms)` for the desired analysis.
3. Once the options are configured, run the query to generate the heatmap visualization.

<img src="assets/week2/heyhoney/29 another query but with zoom.png">


## Onboard AWS X-RAY

AWS X-Ray is a fully-managed service that helps you understand how your applications work. It does this by collecting data about requests as they flow through your application, and then visualizing that data in a way that makes it easy to understand.

-  X-Ray daemon is a service that runs on your servers and collects the data that X-Ray needs. It then sends that data to the X-Ray service, which stores it and makes it available to you.

Here is a diagram that shows how the X-Ray daemon works
```SH
Application
   |
   |
   X-Ray Daemon
   |
   |
   X-Ray Service
   |
   |
End User
```

1. The application sends requests to the X-Ray daemon. <br>
2. The X-Ray daemon collects data about the requests and sends it to the X-Ray service.<br>
3. The X-Ray service stores the data and makes it available to you.

*X-Ray can help you*
* Identify performance bottlenecks
* Track down errors
* Understand your application's architecture

The X-Ray daemon is a required component of X-Ray, and it must be running on your servers in order for X-Ray to function.



### Installing the AWS X-Ray SDK
To use X-Ray, you need to install the AWS X-Ray SDK for your programming language. The SDK will help you collect data about your requests and send it to the X-Ray service.

For Python, you can install the AWS X-Ray SDK by running the following command:
```py
pip install aws-xray-sdk
```

Add `aws-xray-sdk` to `/backend-flask/requirements.txt`
```
aws-xray-sdk
```

#### **Instrumenting your application**

Once you have installed the SDK, you need to instrument your application to collect data about your requests. This involves adding code to your application that will send data to the X-Ray daemon.



- Instrument AWS X-Ray in `/backend-flask/app.py`

Precede the main Flask function in `app.py` by including this code.
```python
from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.ext.flask.middleware import XRayMiddleware
```

Insert the following lines directly after initializing the main Flask function with - `app = Flask(__name__)`

```py
xray_url = os.getenv("AWS_XRAY_URL")
xray_recorder.configure(service='backend-flask', dynamic_naming=xray_url)
XRayMiddleware(app, xray_recorder)
```

### Running the X-Ray daemon
As mentioned earlier, you need to run the X-Ray daemon in order for X-Ray to function.

To run the X-Ray daemon, you can use the following command
```yaml
      - "xray -o -b xray-daemon:2000"
```

Include the following environment variables under the backend service configuration in `docker-compose.yml`.
```yaml
AWS_XRAY_URL: "*4567-${GITPOD_WORKSPACE_ID}.${GITPOD_WORKSPACE_CLUSTER_HOST}*"
AWS_XRAY_DAEMON_ADDRESS: "xray-daemon:2000"
```

### X-RAY Daemon as Service

To streamline our processes and reduce repetitive tasks, we can incorporate this into our setup.

Integrate the Daemon Service into Docker Compose by adding the below.

```yaml
xray-daemon:
    image: "amazon/aws-xray-daemon"
    environment:
      AWS_ACCESS_KEY_ID: "${AWS_ACCESS_KEY_ID}"
      AWS_SECRET_ACCESS_KEY: "${AWS_SECRET_ACCESS_KEY}"
      AWS_REGION: "ca-central-1"
    command:
      - "xray -o -b xray-daemon:2000"
    ports:
      - 2000:2000/udp
```

<img src="assets/week2/XRAY/8 backend work doing good.png">

The configuration file defines our service `xray-daemon`.
- `image: "amazon/aws-xray-daemon"`: This line specifies the Docker image to be used for the `xray-daemon` service, which is hosted on Amazon ECR (Elastic Container Registry).
- `environment`: This section allows setting environment variables for the service. In this case, it includes the `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_REGION` variables. The values for these variables are provided using environment variable syntax, e.g., `${AWS_ACCESS_KEY_ID}` will be replaced with the actual access key ID during container runtime.
- `command`: The `command` section specifies the command to run within the container. In this case, it executes the `xray` command with the parameters `-o -b xray-daemon:2000`.
- `ports`: This section maps the port `2000/udp` from the container to the host's port `2000`. This enables communication via UDP protocol between the container and the host.

Navigate to X-Ray to observe the data propagated from the platform.

<img src="assets/week2/XRAY/10  the real 10.png">

You also have the capability to delve deeper into a specific segment, enabling you to observe and analyze its details comprehensively. 

<img src="assets/week2/XRAY/12 more.png">

### Traces as Groups in X-Ray
An X-Ray group is a collection of traces, and you can use groups to organize your traces. 

- It can help you make your traces  easier to find.
- It can help you identify errors in your application.
- It can help you track the performance of different parts of your application.

If you do not create a group, all of your traces will be stored in a single group called `default`. This can be helpful if you only have a few traces, but it can be difficult to find traces if you have a lot of them.

1. Create a new X-Ray Group named Cruddur using the following command
```sh
aws xray create-group \
   --group-name "Cruddur" \
   --filter-expression "service(\"backend-flask\")"
```
- Returning

<img src="assets/week2/XRAY/3 crfeate groip.png">


The group will be used to store traces for backend-flask application. The filter expression ensures that only traces for the backend-flask application will be stored in the group.


Here are some additional instructions for creating an X-Ray group
- You must be authenticated to the AWS CLI before you can run this command.
- You must have the AWS CLI installed It includes the X Rray.
- You must have the AWS X-Ray SDK installed in your application.

2. Go to the AWS X-Ray console and click the "Groups" section in the left pane under "Configuration" to ensure that the group has been created. 

<img src="assets/week2/XRAY/4- Its here to group traces together..png">

You should see the "Cruddur" group listed.


### Sampling Rule in AWS X-RAY

When a request comes into the application, AWS X-Ray applies the defined Sampling Rules to determine whether that particular request should be traced or not. The level of information you wish to view is controlled by the sampling settings.

By strategically setting Sampling Rules, you can strike a balance between capturing enough data for meaningful insights and not overwhelming the X-Ray service with an excessive amount of trace data.

Let's proceed to define and configure our custom sampling rule.
1. Create `xray.json` file in `aws/json/` and include the following rule

```JSON
{
    "SamplingRule": {
        "RuleName": "Cruddur",
        "ResourceARN": "*",
        "Priority": 9000,
        "FixedRate": 0.1,
        "ReservoirSize": 5,
        "ServiceName": "backend-flask",
        "ServiceType": "*",
        "Host": "*",
        "HTTPMethod": "*",
        "URLPath": "*",
        "Version": 1
    }
  }
```

*Let me now* break down the configuration step by step for you.
- `"RuleName": "Cruddur"`: The name of the Sampling Rule is set to "Cruddur."
- `"ResourceARN": "*"`: The `ResourceARN` field specifies the Amazon Resource Name (ARN) of the AWS resource to which this rule applies. In this case, it is set to "*", which means the rule applies to all resources.
- `"Priority": 9000`: The priority of this rule is set to 9000. Sampling Rules with higher priority take precedence over rules with lower priority when there are conflicting rules for the same request.
- `"FixedRate": 0.1`: The `FixedRate` indicates the sampling rate for this rule. Here, it is set to 0.1, which means approximately 10% of the requests that match this rule's conditions will be traced.
- `"ReservoirSize": 5`: The `ReservoirSize` specifies the number of traces that are allowed before the rule reaches its maximum capacity. In this case, the rule can collect up to 5 traces before it stops sampling new requests.
- `"ServiceName": "backend-flask"`: The `ServiceName` field is used to match against the service name of the incoming request. This rule applies to requests that have a service name equal to "backend-flask."
- `"ServiceType": "*"`: The `ServiceType` field is used to match against the service type of the incoming request. The "*" value means this rule applies to requests of any service type.
- `"Host": "*"`: The `Host` field is used to match against the hostname of the incoming request. The "*" value means this rule applies to requests from any host.
- `"HTTPMethod": "*"`: The `HTTPMethod` field is used to match against the HTTP method of the incoming request. The "*" value means this rule applies to requests with any HTTP method.
- `"URLPath": "*"`: The `URLPath` field is used to match against the URL path of the incoming request. The "*" value means this rule applies to requests with any URL path.
- `"Version": 1`: The `Version` field specifies the version of the Sampling Rule schema. The value 1 represents the first version of the schema used for defining Sampling Rules.


2. To generate the sampling, execute this command.

```bash
aws xray create-sampling-rule --cli-input-json file://aws/json/xray.json
```

3. Access the X-Ray page and navigate to the "Sampling" section to find more.

<img src="assets/week2/XRAY/6 the real 6.png">

You have the option to configure the same settings through the console using a *Cloudops* approach.

### X-Ray Subsegmentation

A subsegment is a nested segment that is created within an existing segment. Subsegments can be used to track the performance of a specific part of your application.

For example, you could create a subsegment for each database query that your application makes. This would allow you to track the performance of your database queries and identify any bottlenecks.

When you use the AWS X-Ray SDK for Python, you can use the `begin_subsegment()` method to create a subsegment within an existing segment. This can be useful for tracking the performance of a specific part of your application.


1. Add the following import statements:
```py
import aws_xray_sdk
from aws_xray_sdk.core import xray_recorder
```
2. Create a new X-Ray recorder and configure it with your AWS account ID and region.
```py
xray_recorder = xray_recorder.create_default_recorder()
xray_recorder.configure(
    service_name="my-service",
    region="ca-central-1",
    sampling_rule_group_name="default",
)
```
4. Start a new segment for your application.
```py
with xray_recorder.start_segment("my-segment"):
    # Do some work here.
```
5. End the subsegment.
```py
xray_recorder.end_subsegment()
```
7. End the main segment.
```py
xray_recorder.end_segment()
```
8. Run cruddur and view view AWS X-Ray console.

Here is an example of how to create a subsegment in Python:
```py
with xray_recorder.start_segment("my-segment"):
    with xray_recorder.begin_subsegment("my-subsegment"):
        # Do some work here.
```

This will create a subsegment called `my-subsegment` within the main segment `my-segment`. The subsegment will be automatically ended when the `with` block is exited.


<img src="assets/week2/XRAY/SUBSEG VIDEO/4 getting more data.png">

Update the segment with the actual endpoint you wish to test, and modify the subsegment with the specific subcomponent you intend to observe closely e.g `activity-home`.

In the past, my way of documenting was [like this](week2-progress.md)... 🤯