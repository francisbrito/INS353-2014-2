# Teachers and Subjects - 20 points

Teacher José wants to have some sort of Web Application where he can actually input his fellow co-workers and information about their subjects. According to our talk, these are the requerimients:

There should be two entities:

`Teacher` and `Subject` where subject `belongs_to :teacher` and teacher `has_many :subjects`

## List of Teachers (10 points)

It should display a list of all the teachers with:

- Teacher Name.
- Teacher Code.
- Amount active of subjects he/she owns.
- Link to delete a teacher entry. (Along with his subjects)
- Link to edit a teacher information.
- A button/link to order the teachers by amount of active subjects (highest-lowest)
- A button/link to order the teachers by Name & Z-A (highest-lowest)

## Creating/Edit Teachers (10 points)

It should allow the owner to edit/create with the following:

- Create a teacher and create his subjects (6) in the same page.
- When going into the teacher edit screen you can edit the subjects for a teacher while displaying it's current Name and Code. *(Teacher INFORMATION IS NOT EDITABLE)*
- `Subject` should be composed of `Subject Name`, `Subject Code` and `Active`.
