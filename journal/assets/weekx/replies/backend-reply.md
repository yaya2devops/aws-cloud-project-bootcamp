### CRUDs

```SQL
[19/Jul/2023 22:22:33] "POST /api/activities HTTP/1.1" 200
SQL Params
```
```json
{
"uuid": "27bb72bd-9c2f-4da5-b25c-b5e16b39578c",
"display_name": "Yahya Abulhaj",
"handle": "yaya2devops",
"message": "Overnight success is real.",
"created_at": "2023-07-19T22:22:33.533537",
"expires_at": "2023-07-26T22:22:33.533179",
"reply_to_activity_uuid": null
}
```

### Replies

```SQL
[19/Jul/2023 22:24:49] "OPTIONS /api/activities/uuid/reply HTTP/1.1" 200 
```

```json
{
"uuid": "27bb72bd-9c2f-4da5-b25c-b5e16b39578c",
"display_name": "Yahya Abulhaj",
"handle": "yaya2devops",
"message": "Right, that transformative night is merely a decade away.",
"created_at": "2023-07-19T22:22:34.224448",
"expires_at": "2023-07-26T22:22:34.224268",
"reply_to_activity_uuid": null
}
```
