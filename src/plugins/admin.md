# Admin Plugin

The admin plugin provides a set of administrator commands that help in moderating active servers.

## Commands

| Name | Description | Default Level | Usage |
|------|-------------|---------------|-------|
| !roles | Returns a list of ids/names for all roles on the server. Useful for configuring other rowboat plugins | Moderator | `!roles` |
| !mute {user} [reason] | Mutes a user for the given reason. This will only work if `mute_role` is set in the config | Moderator | `!mute 232921983317180416 spamming` OR `!tempmute @rowboat#0001 60m spamming` |
| !unmute {user} | Unmutes a user | Moderator | `!unmute 232921983317180416` |
| !tempmute {user} {duration} [reason] | Temporarily mutes a user. Will only work if `temp_mute_role` or `mute_role` is set in the config | Moderator | `!tempmute 232921983317180416 30m spamming` OR `!tempmute @rowboat#0001 30m spamming` |
| !kick {user} [reason] | Kicks the user from the server with the given reason | Moderator | `!kick 232921983317180416 spamming` OR `!kick @rowboat#0001 spamming` |
| !ban {user} [reason] | Bans the user from the server with the given reason | Moderator | `!ban 232921983317180416 spamming` OR `!ban @rowboat#0001 spamming` |
| !forceban {uid} [reason] | Force bans a user who is not currently in the server with the given reason | Moderator | `!forceban 232921983317180416 spamming` |
| !softban {user} [reason] | Softbans (bans/unbans) a user with the given reason | Moderator | `!softban 232921983317180416 spamming` OR `!softban @rowboat#0001 spamming` |
| !tempban {user} {duration} [reason] | Temporarily bans a user with a given reason | Moderator | `!tempban 232921983317180416 5h spamming` OR `!tempban @rowboat#0001 5h spamming` |
| !archive (here / all) [size] | Archives size many messages in the current guild | Moderator | `!archive all 50` OR `!archive here 50` |
| !archive user {user} [size] | Archives size many messages that a given user sent in the current guild | Moderator |
| !archive channel {channel} [size] | Archives size many messages in the given channel | Moderator | `!archive user 232921983317180416 100` OR `!archive user @rowboat#0001 100`
| !clean all [size] | Cleans (deletes) size many messages in the current channel | Moderator | `!clean all 20` |
| !clean user {user} [size] | Cleans size many messages a given user sent in the current channel | Moderator | `!clean user 232921983317180416 50` |
| !clean bots [size] | Cleans size many messages sent by bots in the current channel | Moderator | `!clean bots 30` |
| !msgstats {user} [channel] | Presents message statistics for a given user in the current guild (or specified channel) | Moderator | `!msgstats 232921983317180416` |
| !emojistats (global / server) most | Displays the most used server emojis in the current guild or globally | Moderator | `!emojistats global most` |
| !emojistats (global / server) least | Displays the least used server emojis in the current guild or globally | Moderator | `!emojistats server least` |

## Configuration Options

| Option | Description | Type | Default |
|--------|-------------|------|---------|
| confirm\_actions | Whether to confirm ban/kick actions in the current channel | bool | true |
| mute\_role| Role ID that is set for users who are muted | id | none |
| temp\_mute\_role | Role ID that is set for users who are muted. If not set, defaults to `mute_role` | id | none |
| persist | Controls the member persistance settings | dict | empty |

### Member Persistance Settings

| Option | Description | Type | Default |
|--------|-------------|------|---------|
| roles | Whether to recover roles when a user rejoins the server | bool | false |
| role\_ids | A list of role ids which will be recovered if `roles` is true. Any other roles will be ignored when a user rejoins the server | list | empty |
| nickname | Whether to recover the nickname when a user rejoins the server | bool | false |
| voice | Whether to recover mute/deafen settings when a user rejoins the server | bool | false |


## Configuration Example

```
	admin:
		confirm_actions: false
		mute_role: 289494296703533058
		temp_mute_role: 274638000820846592
		DONT_MENTION_B1NZY: true
		persist:
			roles: true
			role_ids: [290295853124550657, 289494296703533058]
			nickname: true
			voice: false
```
