-- this file was manually created

INSERT INTO
    public.users (
        display_name,
        email,
        handle,
        cognito_user_id
    )
VALUES (
        'Yahya Abulhaj',
        'yahyaincloud@gmail.com',
        'yaya2devops',
        'MOCK'
    ), (
        'Andrew Brown',
        'andrewb@exampro.co',
        'andrewbrown',
        'MOCK'
    ), (
        'Andrew Bayko',
        'bayko@exampro.co',
        'bayko',
        'MOCK'
    ), (
        'Londo Mollari',
        'lmollari@centari.com',
        'londo',
        'MOCK'
    );
    

INSERT INTO
    public.activities (user_uuid, message, expires_at)
VALUES ( (
            SELECT uuid
            from public.users
            WHERE
                users.handle = 'yaya2devops'
            LIMIT
                1
        ), 'This was imported as seed data!', current_timestamp + interval '10 day'
    )