# Students and Grades - 10 points

Teacher José wants to have some sort of Web Application where he can actually input his students grades. According to our talk, these are the requerimients:

There should be two entities:

`Student` and `Grade` where grade `belongs_to :student` and student `has_many :grades`

## List of Students (3 points)

- It should display a list of all the students with:
-- Student Name.
-- Student University ID.
-- Student Average Grade Score.
-- Link to delete a student entry.
-- Link to edit a student information.
-- Sorted by Student Name (A-Z).

## Creating/Edit Students (3 points)

- It should allow the teacher to edit/create with the following:
-- Create a student and create his grades in the same page.
-- Edit the grades for a student while displaying it's current Name, UniversityID and Average Grade Score. *(STUDENT INFORMATION IS NOT EDITABLE)*
-- Grades should be composed of `Subject Name`, `Score` and `Subject ID`.

## Error handling and Validations (4 points)

-- Properly display error/success messages.
-- Properly validate: `Name` for not null, `University ID` for numbers only and `Average Grade` as a decimal on students and all the files for not null on Grades.

## Extra (3 points)

- Build a page that displays all the student information (including grades) and allows to create/display comments.
