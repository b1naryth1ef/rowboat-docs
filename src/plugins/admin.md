# Admin Plugin

The admin plugin provides a set of administrator commands that help in moderating active servers.

## Commands

| Name | Description | Default Level |
|------|-------------|---------------|
| !roles | Returns a list of ids/names for all roles on the server. Useful for configuring other rowboat plugins | Moderator |
| !mute {user} [reason] | Mutes a user for the given reason. This will only work if `mute_role` is set in the config | Moderator |
| !unmute {user} | Unmutes a user | Moderator |
| !tempmute {user} {duration} [reason] | Temporarily mutes a user. Will only work if `temp_mute_role` or `mute_role` is set in the config | Moderator |
| !kick {user} [reason] | Kicks the user from the server with the given reason | Moderator |
| !ban {user} [reason] | Bans the user from the server with the given reason | Moderator |
| !forceban {uid} [reason] | Force bans a user who is not currently in the server with the given reason | Moderator |
| !softban {user} [reason] | Softbans (bans/unbans) a user with the given reason | Moderator |
| !tempban {user} {duration} [reason] | Temporarily bans a user with a given reason | Moderator |
| !archive (here / all) [size] | Archives size many messages in the current guild | Moderator |
| !archive user {user} [size] | Archives size many messages that a given user sent in the current guild | Moderator |
| !archive channel {channel} [size] | Archives size many messages in the given channel | Moderator |
| !clean all [size] | Cleans (deletes) size many messages in the current channel | Moderator |
| !clean user {user} [size] | Cleans size many messages a given user sent in the current channel | Moderator |
| !clean bots [size] | Cleans size many messages sent by bots in the current channel | Moderator |
| !msgstats {user} [channel] | Presents message statistics for a given user in the current guild (or specified channel) | Moderator |
| !emojistats most | Displays the most used emojis in the current guild | Moderator |
| !emojistats least | Displays the least used emojis in the current guild | Moderator |

## Configuration Options

| Option | Description | Type | Default |
|--------|-------------|------|---------|
| confirm\_actions | Whether to confirm ban/kick actions in the current channel | bool | true |
| persist | Controls the member persistance settings | dict | empty |
| mute\_role| Role ID that is set for users who are muted | id | none |
| temp\_mute\_role | Role ID that is set for users who are muted. If not set, defaults to `mute_role` | id | none |

### Member Persistance Settings

| Option | Description | Type | Default |
|--------|-------------|------|---------|
| roles | Whether to recover roles when a user rejoins the server | bool | false |
| nickname | Whether to recover the nickname when a user rejoins the server | bool | false |
| voice | Whether to recover mute/deafen settings when a user rejoins the server | bool | false |
| role\_ids | A list of role ids which will be recovered if `roles` is true. Any other roles will be ignored when a user rejoins the server | list | empty |
