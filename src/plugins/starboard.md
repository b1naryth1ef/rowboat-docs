# Starboard Plugin

The starboard plugin provides an ongoing board of highlighted messages through community voting.

## Configuration Options

| Option | Description | Type | Default |
|--------|-------------|------|---------|
| channels | A mapping of channels to Starboard Configurations | dict | empty |

### Starboard Configuration

| Option | Description | Type | Default |
|--------|-------------|------|---------|
| channels | Sets which channel starred messages should be posted to | dict | empty |
| clear\_on\_delete | Whether a starboard entry is deleted if the original message is deleted | bool | true |
| min\_stars | Minimum number of star reactions required before a message is posted to the starboard | int | 1 |
| star\_color\_max | Sets the "max" star level. Changes shading of rich embed bar color per level and gives the starboard entry a different emoji at max level | int | 15 |
| prevent\_self\_star | Whether to prevent a user from starring their own message | bool | false |

## Configuration Example

```
  starboard:
    channels:
      301118039326457867:
	    clear_on_delete: true
        min_stars: 6
        star_color_max: 15
        prevent_self_star: true
```