# Setting Up Rowboat

## Adding the Bot

Join https://discord.gg/rowboat and post your request in the #server-requests channel, following the instructions in the channel topic. Minimum requirement is 1K active users. 

## How to Set Up

Each section on the sidebar will provide an example followed by a breakdown of what each component does.

Here is a blank configuration example with web, utilities, admin, modlog, spam, and censor set up:

```
web:
  # Username
  ##################: admin
  # Username
  ##################: editor
  # Username
  ##################: viewer

commands:
  overrides: []
  prefix: '!'

levels:
  # Role
  ##################: ###

nickname: R0WB0AT

plugins:

  utilities: {}
  
  admin:
    mute_role: ##################
    
  modlog:
    channels:
      #######################:
        exclude: [GUILD_MEMBER_AVATAR_CHANGE]
        include: []
    ignored_users: []
    
  spam:
    levels:
      0:
        punishment: TEMPMUTE
		punishment_duration: 120
        max_messages:
          count: 10
          interval: 7
        max_mentions:
          count: 8
          interval: 30
        max_links:
          count: 10
          interval: 60
        max_emojis:
          count: 100
          interval: 120
        max_newlines:
          count: 60
          interval: 120
        max_duplicates:
          count: 5
          interval: 30
          
  censor:
    levels:
      0:
        filter_invites: true
        invites_whitelist: ['discord-developers', 'discord-testers', 'discord-api', 'events', 'discord-linux', 'gamenight']
        filter_domains: false
```



### Web

```
web:
  # b1nzy
  80351110224678912: admin
```

Web determines which users are able to view the configuration dashboard for the server. Commenting a line with the Username above each ID helps with organization.

User ID is used to assign ranks. There are three ranks you can assign: admin, editor,  viewer. Admin can add more users (including other Admins), edit, and view the dashboard. Editor can edit and view the dashboard. Viewer can only view.

### Nickname

```
nickname: R0WB0AT
```

Set a nickname for the bot! Nickname is applied upon reload of the bot.

### Levels

```
levels:
  # Admin
  290295853124550657: 100
  # Moderator
  295476842935353345: 50
  # Trusted
  298993418577903616: 10
```

This is where you assign levels to each role! Remember, the default level is 0 if a user doesn't have one of the listed roles. Users will have the highest level of the roles they're assigned.

By default, each level has a certain rank associated with it: 0 - Default, 10 - Trusted, 50 - Mod, 100 - Admin. You can view the default rank required for each command on the [Rowboat Docs](https://rowboat.party/plugins/admin.html)

Levels can be assigned anywhere from 0 to 100, keeping in mind the default permissions given in the Rowboat Docs.

### Commands and Overrides

```
commands:
  overrides:
  - {plugin.name: 'utilities', out: {level: 10}}
  - {group: 'clean', out: {level: 40}}
  - {name: 'mute', out: {level: 40}}
  prefix: '!'
```

Here, you can change your prefix, which is the symbol which begins each command. For example: !ban, $ban, ^ban, rb!ban

Overrides allow you to customize which levels and roles can use each command, or group of commands.

"plugin.name" is used for all commands in a plugin (hint: every section that's indented one in beneath the "plugins:" section is a plugin)  
"group" is used for commands which have multiple components. Some example: clean, archive, role, stars)  
"name" is used for all other commands.  
"out: {level: }}" is used to assign the minimum level required to use the command.

You can use "out: {level: }}" by itself to set a minimum required level for ALL commands!

Taking the configuration above as an example, if you didn't want all members to use utility commands (such as jumbo, info, and cat), you can set the level of the "utilities" plugin to 10. This means the role must have at least level 10 assigned to it to use utility commands.

### Plugins
  
Utilities, Admin, ModLog, Censor, Spam, Starboard, Reddit

Read below for information on each plugin! Keep in mind each plugin section should be indented appropriately under "plugins:"

### Utilities

```
  utilities: {}
```

There's nothing more to set up for this section.
  
### [Admin](https://rowboat.party/plugins/admin.html)

```	   
  admin:
    mute_role: 289494296703533058
    DONT_MENTION_B1NZY: true
    persist:
      roles: true
      # role_ids: [290295853124550657, 289494296703533058]
      nickname: true
      voice: false
```

The Admin plugin allows you to use rowboat's moderation commands such as ban, kick, mute, and clean. No set up is needed to use commands aside from having the admin plugin declared. You can also customize other settings, explained below.

"mute_role" String. Designates which role will be assigned when the "mute" or "tempmute" command is used. Mute commands will not work if a role is not assigned. The mute role should be manually set up however you want, the bot will not automatically assign the proper permissions to the role.  
"DONT_MENTION_B1NZY" Boolean. If set to true will automatically tempban any user without a role who mentions b1nzy#1337. Tempban lasts one week.  
"persist" Dictionary. Returns the specified component to the user if they leave and rejoin the server.  
"roles" Boolean. If set to true will tell the bot to re-assign roles.  
"role_ids" List of User IDs. Allows you to designate specific roles which should be re-assigned.  
"nicknames" Boolean. If set to true tells the bot to re-assign nicknames.  
"voice" Boolean. If set to true tells the bot to re-apply any voice Server Mutes and Server Deafens.
	
	
### [Modlog](https://rowboat.party/plugins/modlog.html)

```
  modlog:
    channels:
      289494042000228352:
        timestamps: true
        timezone: GMT+0
        exclude: [GUILD_MEMBER_AVATAR_CHANGE]
        include: []
    ignored_users: [202217402635780096]
```

Modlog allows you to see events and changes that happen on your server.

"channels" Dictionary of Channel IDs. Designates which channel the bot logs events to. Channel ID should be listed below, properly indented. This means you can have multiple channels and seperate your modlogs based on events if you'd like.  
"timestamps" Boolean. If set to true will append a timestamp in front of each log event.  
"timezone" String. Designates which timezone that timestamps are rendered in.  
"exclude" List of API Events. Events which will be excluded from the log. If empty, it'll include all events.  
"include" List of API Events. Events which will be included. If empty, it'll exclude no events. If events are provided, it'll only include those events and disregard the exclude setting.  
"ignored_users" List of User IDs. Will exclude events from the User IDs listed. Bot commands will still be logged.  

### [Censor](https://rowboat.party/plugins/censor.html)

```
  censor:
    levels:
      0:
        filter_zalgo: true
        filter_invites: true
        invites_guild_whitelist: [205769246008016897, 272885620769161216]
		invites_blacklist: []
        invites_whitelist: ['discord-developers', 'discord-testers', 'discord-api', 'discord-events', 'discord-linux', 'gamenight',]
		filter_domains: true
		domains_blacklist: ['website.net']
		domains_whitelist: []
        blocked_words: ['example' 'of' 'blocked' 'words']
		blocked_tokens: ['ok']
```

Censor will remove messages with anything that triggers it.

"levels" Integer. Sets which level and below will be affected by the censor. At level 0, any role that's listed under the "levels" plugin with a level higher than 0 will be excluded from the censor.  
"filter_zalgo" Boolean. Delete messages with any zalgo character detected.  
"filter_invites" Boolean. Remove messages with invites, unless they have been whitelisted.  
"invite_guild_whitelist" List of Server IDs. Whitelists all invites originating from the listed Server IDs.  
"invites_blacklist" List of Strings. Remove all messages with the invites listed. Takes vanity URLs or regular invite codes.  
"invites_whitelist" List of Strings. Allow invites listed to be sent. Takes Vanity URLs or regular invite codes.  
"filter_domains" Boolean. Remove messages with domains and links. Must be a full click-able link such as "https://google.com". It will not remove "google.com".  
"domains_blacklist" List of Strings. Remove all messages with the domains listed.  
"domains_whitelist" List of Strings. Allow domains listed to be sent.  
"blocked_words" List of Strings. Removes all messages with the listed words. Words must match exactly.  
"blocked_tokens" List of String. Removes messages if any of the listed words appear in the message, even within another word. If "ok" is blocked, then a message containing the word "broke" will be removed.

### Spam

```
  spam:
    levels:
      0:
        punishment: TEMPMUTE
		punishment_duration: 120
        max_messages:
          count: 10
          interval: 7
        max_mentions:
          count: 8
          interval: 30
        max_links:
          count: 10
          interval: 60
        max_emojis:
          count: 100
          interval: 120
        max_newlines:
          count: 60
          interval: 120
        max_duplicates:
          count: 5
          interval: 30
```

The spam filter applies a punishment (if set) to users who trigger it. Prevent users from spamming your server!

"levels" Integer. Sets which level and below will be affected by the filter.  
"punishment" String. Sets which action is performed when the spam filter is triggered. Options are: NONE, MUTE, TEMPMUTE, BAN, TEMPBAN, KICK  
"punishment_duration" Integer. Required for TEMPBAN and TEMPMUTE punishments and determines how long the punishment will last. The value is in seconds.  
"count" Integer. Sets how many times an action should be performed for it to trigger the filter.  
"interval" Integer. Sets the time period within which the "count" of actions should be performed to trigger the filter. The value is in seconds.  
"max_messages" Integer. Total number of messages that can be sent.  
"max_mentions" Integer. How many user mentions can be sent.  
"max_links" Integer. How many links can be sent.  
"max_emojis" Integer. How many emojis can be sent.  
"max_newlines" Integer. How many new lines/line breaks can be sent.  
"max_duplicates" Integer. How many duplicate messages can be sent.


### Starboard

```
  starboard:
    channels:
      301118039326457867:
	    clear_on_delete: true
        min_stars: 6
        star_color_max: 15
        prevent_self_star: true
```

Starboard allows users to vote on messages using :star: reactions. After the specified "min_stars" amount is reached on a message, it gets posted to the starboard channel. A sort of "Hall of Fame" for great messages.

"channels" Channel ID. Sets the which channel starred messages should be posted to.  
"clear_on_delete" Boolean. Dictates whether a starboard entry is deleted if the original message is deleted.  
"min_stars" Integer. Sets the minimum number of star reactions required before a message is posted to the starboard.  
"star_color_max" Integer. Sets the number of stars required before the starboard entry gets a :star2: icon instead of a regular :star:. Only for aesthetics.  
"prevent_self_star" Boolean. Prevents a user from starring their own message by removing the reaction.

### Reddit

```
  reddit:
    subs:
      discordapp:
        channel: 281855195095236608
        mode: plain
        nsfw: false
        include_stats: true
```

"subs" String. Subreddits which the bot pulls from. Similar to modlog in that you can setup multiple subreddits on multiple channels.  
"channel" Channel ID.  
"mode" String. Format of the entries. Options: PRETTY, PLAIN  
"nsfw" Boolean. Whether to include NSFW posts.  
"include_stats" Boolean. Whether to include statistics about the post.
