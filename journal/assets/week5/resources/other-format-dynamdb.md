
## You may like this format.

| Acro | Attribute | Description |
|---|---|---|
| **pk** | Primary key | This is a combination of the `message_group_uuid` and `created_at` fields. This ensures that each message is uniquely identified. |
| **sk** | Sort key | This is the `created_at` field. This ensures that messages are sorted in chronological order. |
| `data` | Data | A JSON object that contains the data for the message. This includes the message text, the sender's username, and the sender's UUID. |
| `uuid` | UUID | The UUID of the message. This is a unique identifier for the message. |
| `display_name` | Display name | The display name of the sender. This is the name that the sender uses to identify themselves. |
| `handle` | Handle | The handle of the sender. This is the username that the sender uses to log in to the application. |
| `message` | Message | The text of the message. This is the message that the sender wants to send to the group. |
| `user_uuid` | User UUID | The UUID of the sender. This is the unique identifier for the sender. |
| `message_group_uuid` | Message group UUID | The UUID of the message group. This is a unique identifier for the group of messages. |