# Exam 01 - 20 Points

## Users and Posts

Gabriel wants to have some sort of class structure to manage his users and posts. In our ﬁrst midterm we’re going to be providing Gabriel with these awesome classes and methods since he is a very picky customer we must use TDD in order to make sure our code works as intended.


### The funcionalities for the ```User``` class are the following:

- It should receive an username and have N amount of ```Post```s when initialized.
- It should have ```#add_post``` which accepts a Date of publication, Text and Title.
- It should have ```#posts``` which returns an ```Array``` of the posts we have added; in reverse chronological order. (Newest first).
- It should have ```#list``` which outputs all the posts using ```#display_entry```.
- It should have ```#find_post_by_title``` which accepts a post's Title and returns a ```Post```. (First one if there are multiple with the same name)

### The functionalities for the ```Post``` class are the following:

- It should receive a Title, Text, Date and User or a ```.yml``` file when initialized.
- It should have ```#summary``` which displays the first 10 words of the text attribute.
- it should have ```#tagme``` which receives ```N``` amount of tags and applies them to the post.
- It should have ```#same?``` which receives a ```Post``` object and returns a ```boolean``` if they have the same attributes (Title, Text, Date only).
- It should have ```#save``` which saves the post to a ```.yml``` file, preferably filename should be the title parameterized. IE: "My awesome Title" => my-awesome-title.yml
- It should have ```#display_entry``` which outputs the following:

```ruby
  $ post.display_entry 
  =>
  Gabriel, 2013-06-06
  My Blog Title
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae est eget ipsum tincidunt accumsan at eu mi tor."
  Tags: :supercool, :awesome, :bonkers
```


## Bonus - 10 points

### Tag Cloud:

Build a Function that properly calculates the top 5 tags in all of an ```User```'s post and displays them sorted by frequency.

```ruby 
$ user.tag_cloud
=>
  1. :electronics - 245
  2. :sports - 150
  3. :gaming - 100
  4. :school - 80
  5. :programming - 50
