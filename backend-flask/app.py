import os
import sys

# Middleware for JWT
#from lib.middleware import middleware  # for middleware auth

from flask import Flask
from flask import request, g

#---Refactored-----
#from flask_cors import cross_origin
#from aws_xray_sdk.core import xray_recorder

from lib.rollbar import init_rollbar
from lib.xray import init_xray
from lib.cors import init_cors
from lib.cloudwatch import init_cloudwatch
from lib.honeycomb import init_honeycomb
from lib.helpers import model_json

#---Refactored Routes-----
#from services.users_short import *
#from services.home_activities import *
#from services.notifications_activities import *
#from services.user_activities import *
#from services.create_activity import *
#from services.create_reply import *
#from services.search_activities import *
#from services.message_groups import *
#from services.messages import *
#from services.create_message import *
#from services.show_activity import *
#from services.update_profile import *
#--------
import routes.general
import routes.activities
import routes.users
import routes.messages
#--------


#---Refactored--- 
#Authorization JWT
#from lib.cognito_jwt_token import jwt_required

# HoneyComb ---------
#from opentelemetry import trace
#from opentelemetry.instrumentation.flask import FlaskInstrumentor
#from opentelemetry.instrumentation.requests import RequestsInstrumentor
#from opentelemetry.exporter.otlp.proto.http.trace_exporter import OTLPSpanExporter
#from opentelemetry.sdk.trace import TracerProvider
#from opentelemetry.sdk.trace.export import BatchSpanProcessor
#from opentelemetry.sdk.trace.export import ConsoleSpanExporter, SimpleSpanProcessor

# AWS Xray for reference----
#from aws_xray_sdk.core import xray_recorder
#from aws_xray_sdk.ext.flask.middleware import XRayMiddleware


# Cloudwatch logs
#import watchtower
#import logging


# Rollbar ------------
#from time import strftime
#import os
#import rollbar
#import rollbar.contrib.flask
#from flask import got_request_exception

# Configuring Logger to Use CloudWatch
# LOGGER = logging.getLogger(__name__)
# LOGGER.setLevel(logging.DEBUG)
# console_handler = logging.StreamHandler()
# cw_handler = watchtower.CloudWatchLogHandler(log_group='cruddur')
# LOGGER.addHandler(console_handler)
# LOGGER.addHandler(cw_handler)
# LOGGER.info("test log")

# HoneyComb things for reference 2-----
# Initialize tracing and an exporter that can send data to Honeycomb
#provider = TracerProvider()
#processor = BatchSpanProcessor(OTLPSpanExporter())
#provider.add_span_processor(processor)

# x-ray ----------------
#xray_url = os.getenv("AWS_XRAY_URL")
#xray_recorder.configure(service='backend-flask', dynamic_naming=xray_url)


# AWS Xray for reference2 for starting the recorder----
#xray_url = os.getenv("AWS_XRAY_URL")
#xray_recorder.configure(service='backend-flask', dynamic_naming=xray_url)

# OTEL ----------
# Show this in the logs within the backend-flask app (STDOUT)
#simple_processor = SimpleSpanProcessor(ConsoleSpanExporter())
#provider.add_span_processor(simple_processor)

#trace.set_tracer_provider(provider)
#tracer = trace.get_tracer(__name__)
#--------------- 


app = Flask(__name__)

## initalization --------
init_xray(app)
#with app.app_context():
#  rollbar = init_rollbar()
init_honeycomb(app)
init_cors(app)


#app.wsgi_app = middleware(app.wsgi_app)

#-- Refactor-----
# X-RAY ----------
#XRayMiddleware(app, xray_recorder)

# HoneyComb ---------
# Initialize automatic instrumentation with Flask
#FlaskInstrumentor().instrument_app(app)
#RequestsInstrumentor().instrument()

#frontend = os.getenv('FRONTEND_URL')
#backend = os.getenv('BACKEND_URL')
#origins = [frontend, backend]
#cors = CORS(
#  app, 
#  resources={r"/api/*": {"origins": origins}},
#  headers=['Content-Type', 'Authorization'], 
#  expose_headers='Authorization',
#  methods="OPTIONS,GET,HEAD,POST"
#)

# CloudWatch Logs -----
#@app.after_request
#def after_request(response):
#    timestamp = strftime('[%Y-%b-%d %H:%M]')
#    LOGGER.error('%s %s %s %s %s %s', timestamp, request.remote_addr, request.method, request.scheme, request.full_path, response.status)
#    return response
#  init_cloudwatch(response)




# Previous RB Coding. In 2022, Rollbar revenue run rate hit $7.1M in revenue. damn.
#@app.before_first_request
#def init_rollbar():
#    """init rollbar module"""
#    rollbar.init(
#        # access token
#        rollbar_access_token,
#        # environment name
#        'production',
#        # server root directory, makes tracebacks prettier
#        root=os.path.dirname(os.path.realpath(__file__)),
#        # flask already sets up logging
#        allow_logging_basic_config=False)

rollbar_access_token = os.getenv('ROLLBAR_ACCESS_TOKEN')

#with app.app_context():
#
#    def init_rollbar():
#        """init rollbar module"""
#        flask_env = os.getenv('FLASK_ENV')
#        rollbar.init(
#            # access token
#            rollbar_access_token,
#            # environment name
#            flask_env,
#            # serverss root directory, makes tracebacks prettier
#            root=os.path.dirname(os.path.realpath(__file__)),
#            # flask already sets up logging
#            allow_logging_basic_config=False,)
#            # send exceptions from `app` to rollbar, using flask's signal system
#        got_request_exception.connect(rollbar.contrib.flask.report_exception, app)

#---Refactored Routes---
#def model_json(model):
#  if model['errors'] is not None:
#    return model['errors'], 422
#  else:
#    return model['data'], 200

#@app.route('/api/health-check')
#def health_check():
#  return {'success': True, 'ver': 1}, 200

#@app.route('/rollbar/test')
#def rollbar_test():
#    rollbar.report_message('Hello Latest Flask Version!', 'warning')
#    return "Hello World!"

#@app.route("/api/message_groups", methods=['GET'])
#@jwt_required()
#def data_message_groups():
#  model = MessageGroups.run(cognito_user_id=g.cognito_user_id)
#  return return_model(model)

#@app.route("/api/messages/<string:message_group_uuid>", methods=['GET'])
#@jwt_required()
#def data_messages(message_group_uuid):
#  model = Messages.run(
#      cognito_user_id=g.cognito_user_id,
#      message_group_uuid=message_group_uuid
#    )
#  return return_model(model)

#@app.route("/api/messages", methods=['POST','OPTIONS'])
#@cross_origin()
#@jwt_required()
#def data_create_message():
#  message_group_uuid   = request.json.get('message_group_uuid',None)
#  user_receiver_handle = request.json.get('handle',None)
#  message = request.json['message']
#  if message_group_uuid == None:
#    # Create for the first time
#    model = CreateMessage.run(
#      mode="create",
#      message=message,
#      cognito_user_id=g.cognito_user_id,
#      user_receiver_handle=user_receiver_handle
#    )
#  else:
#    # Push onto existing Message Group
#    model = CreateMessage.run(
#      mode="update",
#      message=message,
#      message_group_uuid=message_group_uuid,
#      cognito_user_id=g.cognito_user_id
#    )
#  return return_model(model)


##def default_home_feed(e):
  # unauthenicatied request
##  app.logger.debug(e)
##  app.logger.debug("unauthenicated")
##  data = HomeActivities.run()
##  return data, 200


##@app.route("/api/activities/home", methods=['GET'])
###@xray_recorder.capture('activities_home')
##@jwt_required(on_error=default_home_feed)
##def data_home():
##  data = HomeActivities.run(cognito_user_id=g.cognito_user_id)
##  return data, 200

##@app.route("/api/activities/notifications", methods=['GET'])
##def data_notifications():
##  data = NotificationsActivities.run()
##  return data, 200

##@app.route("/api/activities/@<string:handle>", methods=['GET'])
###@xray_recorder.capture('activities_users')
##def data_handle(handle):
##  model = UserActivities.run(handle)
##  return return_model(model)

##@app.route("/api/activities/search", methods=['GET'])
##def data_search():
##  term = request.args.get('term')
##  model = SearchActivities.run(term)
##  return model_json(model)


##@app.route("/api/activities", methods=['POST','OPTIONS'])
##@cross_origin()
##@jwt_required()
##def data_activities():
##  message = request.json['message']
##  ttl = request.json['ttl']
##  model = CreateActivity.run(message, g.cognito_user_id, ttl)
#  return return_model(model)

#@app.route("/api/activities/<string:activity_uuid>", methods=['GET'])
#@xray_recorder.capture('activities_show')
#def data_show_activity(activity_uuid):
#  data = ShowActivity.run(activity_uuid=activity_uuid)
#  return data, 200

#@app.route("/api/activities/<string:activity_uuid>/reply", methods=['POST','OPTIONS'])
#@cross_origin()
#def data_activities_reply(activity_uuid):
#  user_handle  = 'yaya2devops'
#  message = request.json['message']
#  model = CreateReply.run(message, user_handle, activity_uuid)
#  return return_model(model)
#  return

#@app.route("/api/users/@<string:handle>/short", methods=['GET'])
#def data_users_short(handle):
#  data = UsersShort.run(handle)
#  return data, 200  

#@app.route("/api/profile/update", methods=['POST','OPTIONS'])
#@cross_origin()
#@jwt_required()
#def data_update_profile():
#  bio          = request.json.get('bio',None)
#  display_name = request.json.get('display_name',None)
#  model = UpdateProfile.run(
#    cognito_user_id=g.cognito_user_id,
#    bio=bio,
#    display_name=display_name
#  )
#  return model_json(model)


# ------load routes -----------

routes.general.load(app)
routes.activities.load(app)
routes.users.load(app)
routes.messages.load(app)
# ------load routes -----------

if __name__ == "__main__":
  app.run(debug=True)