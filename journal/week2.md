# Week 2 — Distributed Tracing




--- HoneyComb Part------
# A- Set Honeycomb API Env Var

```
export HONEYCOMB_API_KEY="Kk4cyhQ9zhCxNKg1BzyCyA"
```

```
gp env HONEYCOMB_API_KEY="Kk4cyhQ9zhCxNKg1BzyCyA"
```
# B-Hard code Service Name  in docker compose

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
  backend-flask:
    environment:
      FRONTEND_URL: "https://3000-${GITPOD_WORKSPACE_ID}.${GITPOD_WORKSPACE_CLUSTER_HOST}"
      BACKEND_URL: "https://4567-${GITPOD_WORKSPACE_ID}.${GITPOD_WORKSPACE_CLUSTER_HOST}"
      OTEL_SERVICE_NAME: "backend-flask" //this you can name it like u want. 

```
> Automatic Instrumentation isnt as good in the frontend.


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

Making code explicit, env var are sneaky. 

Env var are technically easy but.


## D- Docker Compose up
No need to build the container, it will do it for us. Simple let the docker compose do the magic.