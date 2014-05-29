# Teams and Players

Nelson needs a small application that can handle teams and players for his fantasy draft.

In order to meet with the requirements we'll need to build 2 simple classes.

You can use this snippet to require specific classes from the lib folder, in case you want to organize your code:

```ruby
["player", "team"].each do |f|
	require File.join(File.dirname(__FILE__), '..', "lib/#{f}.rb")
end
```

## Team Class

The ```Team``` class will allow us manage players and will allow us to:

- Set a Team Name
- Add players to the team
- Remove players from the team
- Output all the players from team
- Allow us to filter players by position

```ruby
class Team
  def add_player(name, position)
  end

  def remove_player(name)
  end

  def filter_by_position(position)
    # returns players in the given position
  end

  def to_s
   # output team name + players list.
  end
end
```
## Player Class

The ```Player``` class will allow us to create players by:

- Allow us to set a player's name/position.
- Output a player's name/position seperated by a ``` - ```. IE: ```Jose Gomez - SS```

The Player
```ruby
class Player
end
```
