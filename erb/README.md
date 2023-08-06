

## Read `ENV` Using Ruby

To handle environment variables effectively in your application, we will create Ruby scripts that can read and map these variables.

Separate scripts will be used for the frontend and backend environments.

- The Ruby script for the frontend environment variables can be found here: [`generate-env`](../bin/frontend/generate-env).
- Similarly, the Ruby script for the backend environment variables is available here: [`generate-env`](../bin/backend/generate-env).


*Next*, you need to create specific files to store the required environment variables

- For the **backend** variables, use the file `backend-flask.env.erb`.
- And for the **frontend** variables, use the file `frontend-react-js.env.erb`.
- For the **frontend** CloudFront Sync, use the file `sync.env.erb`.

| Environment                  | File                                |
| ---------------------------- | ----------------------------------- |
| Backend Environment                     | [`backend-flask.env.erb`](backend-flask.env.erb)               |
| Frontend Environment                    | [`frontend-react-js.env.erb`](frontend-react-js.env.erb)       |
|CloudFront Sync     | [`sync.env.erb`](sync.env.erb)                       |



Make sure to include the necessary configuration options in your `docker-compose.yml`

- Include the configuration option for [backend](../docker-compose.yml#L5) to your `docker-compose.yml`
- Include the configuration option for [frontend](../docker-compose.yml#L17) to your `docker-compose.yml`


Execute the following commands to generate the magical environment variables.

- **Frontend**
```sh
./bin/frontend/generate-env
```

- **Backend**
```sh
./bin/backend/generate-env
```

**To** *automate* the process of generating environment variables when starting a new workspace, Update your `.gitpod.yml` 
```sh
ruby "./bin/backend/generate-env"
ruby "./bin/backend/generate-env"
 ```
Please consult the gitpod automation setup.
- For the frontend, refer to [`.gitpod.yml` line 28](../.gitpod.yml#L27).
- For the backend, refer to [`.gitpod.yml` line 42](../.gitpod.yml#L41).
