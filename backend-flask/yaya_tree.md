```sh
./
├── app.py
├── bin/
│   └── health-check*
├── buildspec.yml
├── db/
│   ├── kill-all-connections.sql
│   ├── migrations/
│   │   ├── 16824548085333924_add_bio_column.py
│   │   └── README.md
│   ├── schema.sql
│   ├── seed.sql
│   └── sql/
│       ├── activities/
│       │   ├── create.sql
│       │   ├── home.sql
│       │   └── object.sql
│       └── users/
│           ├── create_message_users.sql
│           ├── short.sql
│           ├── show.sql
│           ├── update.sql
│           └── uuid_from_cognito_user_id.sql
├── Dockerfile
├── Dockerfile.prod
├── Dockerfile.stage
├── external-script.sh
├── lib/
│   ├── cognito_jwt_token.py
│   ├── db.py
│   ├── ddb.py
│   └── middleware.py
├── openapi-3.0.yml
├── README.md
├── requirements.txt
├── services/
│   ├── create_activity.py
│   ├── create_message.py
│   ├── create_reply.py
│   ├── home_activities.py
│   ├── message_groups.py
│   ├── messages.py
│   ├── notifications_activities.py
│   ├── __pycache__/
│   │   ├── create_activity.cpython-38.pyc
│   │   ├── create_message.cpython-38.pyc
│   │   ├── home_activities.cpython-38.pyc
│   │   ├── message_groups.cpython-38.pyc
│   │   ├── messages.cpython-38.pyc
│   │   ├── search_activities.cpython-38.pyc
│   │   └── user_activities.cpython-38.pyc
│   ├── search_activities.py
│   ├── show_activity.py
│   ├── update_profile.py
│   ├── user_activities.py
│   └── users_short.py
├── test-buildspec.yml
└── yaya_tree.md

9 directories, 48 files
```

> The file was generated to make use of it in the *week 1 REVISION 2.1 Journaling.*