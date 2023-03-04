# Week 2 — Distributed Tracing




--- HoneyComb: Stream Part------
# A- Set Honeycomb API Env Var

```
export HONEYCOMB_API_KEY="Kk4cyhQ9zhCxNKg1BzyCyA"
```

```
gp env HONEYCOMB_API_KEY="Kk4cyhQ9zhCxNKg1BzyCyA"
```

<img src="assets/week2/heyhoney/1 set api key env var.png">

# B-Hard code Service Name  in docker compose

<img src="assets/week2/heyhoney/2- include api key and others requirement for honeycomb.png">

You may ask why not these and gg?

```
export HONEYCOMB_SERVICE_NAME="Cruddur" //cruddur Service name in span 
```

```
gp env HONEYCOMB_SERVICE_NAME="Cruddur"
```

:lamp: Because you dont want it to be consistent as your backend services may vary.


### C- Configure Open Telemetry to send for honeycomb

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

honeycomb-whoami.glitch.me to find out what api is that xD

<img src="assets/week2/heyhoney/10 check key.png">

### Restart fresh
<img src="assets/week2/heyhoney/11 new contect .png">

<img src="assets/week2/heyhoney/12 update npm front.png">


### Solved, here is the dashbaord showing data.

<img src="assets/week2/heyhoney/13- SOLVED! about honey dashboard.png">

# Observing 👀

<img src="assets/week2/heyhoney/14 honey queries.png">

<img src="assets/week2/heyhoney/15- HTTP status code.png">

<img src="assets/week2/heyhoney/16- bubble.png">

## Spans:
<img src="assets/week2/heyhoney/17 span sample.png">

## More Observability
<img src="assets/week2/heyhoney/18 daata set daily traffic.png">

<img src="assets/week2/heyhoney/19 HISTOIRY.png">

## I Added Spans:

- 1:Aquiring a tracer:


Go to an api endpoint like the home_activites.py endpoint & add this:

This will help using only the opentelemetryAPI, cause there is fat pack of import.

```
from opentelemetry import trace
```

-and this just a bit down:


```
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



<img src="assets/week2/heyhoney/21 SPAN EXPAND.png">

## Advanced Visibility

#### Required code:
<img src="assets/week2/heyhoney/22 our field.png">

#### Output:
<img src="assets/week2/heyhoney/23 it see our field.png">


### Custom Queries & DB Calls

<img src="assets/week2/heyhoney/24 query eyyyey.png">

<img src="assets/week2/heyhoney/25 query p2.png">

This error happened cause i called the endpoint after running docker compose with python syntax missing identation:
<img src="assets/week2/heyhoney/26 takes me to this span where i had error cause i missed a python syntax.png">
<img src="assets/week2/heyhoney/27 another query.png">
<img src="assets/week2/heyhoney/28 another query.png">

## Dig deep with this feature and + 
<img src="assets/week2/heyhoney/29 another query but with zoom.png">


# Instrument AWS X-Ray

### Install AWS SDK

<img src="week2/XRAY/">

## Create group
```
aws xray create-group \
   --group-name "Cruddur" \
   --filter-expression "service(\"backend-flask\")
```


## Sampling 

a good way to ask it to show you what you really need.


## Create it using CLI using the xray.json

```
aws xray create-sampling-rule --cli-input-json file://aws/json/xray.json
```


### Set up the deamon

