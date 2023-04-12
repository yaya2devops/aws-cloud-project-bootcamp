from werkzeug.wrappers import Request, Response

import os
import json

from lib.cognito_jwt_token import (
    CognitoJwtToken,
    TokenVerifyError,
)

# JWT_Verification
cognito_jwt_token = CognitoJwtToken(
    region=os.getenv("AWS_DEFAULT_REGION"),
    user_pool_client_id=os.getenv("AWS_COGNITO_USER_POOL_CLIENT_ID"),
    user_pool_id=os.getenv("AWS_COGNITO_USER_POOL_ID"),
)


class middleware:
    def __init__(self, app):
        self.app = app

    def __call__(self, environ, start_response):
        request = Request(environ)

        environ["auth"] = False
        environ["claims"] = None
        # environ["request"] = request

        if "Authorization" in request.headers:
            try:
                claims = cognito_jwt_token.extract_access_token(request.headers)

                # transfer data through request
                environ["auth"] = True
                environ["claims"] = claims

            except TokenVerifyError as e:
                print("unauthenticated", e)
                # transfer data through request
                res = Response(
                    json.dumps({"error": "Unauthorized"}),
                    content_type="application/json",
                    status=401,
                )
                return res(environ, start_response)

        return self.app(environ, start_response)
