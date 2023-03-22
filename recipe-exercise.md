# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary                                nouns =  diary, diary entry, todo list, todo, contacts 
                                                              verbs =  record, read
As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

<!-- Design the interfaces of each of your classes and how they will work together. can use diagrams to visualise the relationships between classes.
key verbs and nouns in the problem description to help figure out which classes and methods to have.
Steps 3, 4, and 5 then operate as a cycle. -->


_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
                                 ┌────────────────────────────────────────────┐
                                 │                                            │                   ┌────────────────────────────┐
                                 │  Diary                                     │                   │                            │
  ┌─────────────────────┐        │                                            │                   │   Contacts                 │
  │                     │        │ - add(DiaryEntry)                          │                   │                            │
  │ TaskList            │        │                                            │                   │  - view_phone_numbers      │
  │                     │        │ - view_entries                             │                   │                            │
  │ - add(task)         │        │                                            │                   │  - get_phone_numbers(Diary)│
  │                     │        │ - best_entry_for_reading_time(wpm, minutes)│ ◄─────────────────┤                            │
  │ - view              │        │                                            │                   │                            │
  │                     │ ◄──────┤ - view_todo_list(TaskList)                 │                   └────────────────────────────┘
  │ - remove(task)      │        │                                            │Contacts extracts phone numbers from
  │                     │        └─────────────────────┬──────────────────────┘
  │                     │Diary extracts from           │
  └─────────────────────┘                              │
                                                       │ Diary owns a list of
                                                       │
                                                       │
                                                       ▼
                                  ┌────────────────────────────────────────┐
                                  │  DiaryEntry                            │
                                  │                                        │
                                  │ - initialize (title, contents)         │
                                  │                                        │
                                  │ - contents                             │
                                  │                                        │
                                  │ - count_words                          │
                                  │                                        │
                                  │ - reading_time                         │
                                  │                                        │
                                  └────────────────────────────────────────┘

```
_Also design the interface of each class in more detail._

```ruby
class TaskList
  def initialize
    todo_list = []
  end

  def add(task) # todo is an instance of Todo
    # todo gets added to the todo_list
    # Returns nothing
  end

  def view
    # returns todo_list
  end
  
  def remove(task) # todo is a string
    # deletes todo from the todo_list
    # returns nothing
  end
end


class Diary
  def initialize
    @entries = []
  end

  def add(entry) #entry is an instance of DiaryEntry
    # entry gets added to the entries
    # Returns nothing
  end

  def view_entries
    # returns all entries
  end

  def best_entry_for_reading_time(wpm, minutes) #wpm and minutes are integers
   # returns one best entry for reading time
  end

  def view_todo_list(TaskList)
    # returns list of tasks
  end

end


class DiaryEntry
  def initialize(title, contents)
    @title
    @contents
  end

  def contents
    # Returns contents
  end
  
  def count_words
    # returns length of contents
  end

  def reading_time(wpm, minutes)
    # returns an integer representing minutes
  end

end


class Contacts
  def initialize
    @numbers = [] # array of phone numbers
  end

  def view_phone_numbers
    # Returns @numbers
  end

  def get_phone_numbers
    # get phone numbers from diary entries
  end
  
end


```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# see list of tasks
todo = TaskList.new
diary = Diary.new
todo.add("walk the doggos")
todo.add("go for a run")
diary.view_todo_list(todo) # => [walk the doggos, go for a run]

# see the list of all tasks left after removing a task
todo = TaskList.new
diary = Diary.new
todo.add("walk the doggos")
todo.add("go for a run")
todo.remove("go for a run")
diary.view_todo_list(todo) # => [walk the doggos]


# see all diary entries
diary = Diary.new
entry_1 = DiaryEntry.new("Monday" "Hello Diary ")
entry_2 = DiaryEntry.new("Monday" "Bye Diary ")
diary.add(entry_1)
diary.add(entry_2)
diary.view_entries # => [entry_1, entry_2]

# see best entry for reading times when given multiple diary entry
diary = Diary.new
entry_1 = DiaryEntry.new("Monday", "Hello " * 100)
entry_2 = DiaryEntry.new("Tuesday", "Bye " * 300)
best_entry = DiaryEntry.new("Wednesday", "Thanks " * 150)
diary.add(entry_1)
diary.add(entry_2)
diary.add(best_entry)
diary.best_entry_for_reading_time(200, 1) # => best_entry

# see list of phone numbers
diary = Diary.new
entry_1 = DiaryEntry.new("Monday", "Hello Diary " + "07123456789 ")
diary.add(entry_1)
contacts= Contacts.new
contacts.get_phone_number(diary) # => [07123456789]

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE
# 1 constructs
todo = TaskList.new

# 1 return empty when no todo added
todo = TaskList.new
todo.view # => []

# 2 see number of tasks
todo = TaskList.new
todo.add("walk the doggos")
todo.add("go for a run")
todo.view # => [walk the doggos, go for a run]

# 3 constructs
diary = Diary.new

# 3 constructs
entry_1 = DiaryEntry.new("Monday", "Hello" * 200)

# 4 fails when contents is empty
entry_1 = DiaryEntry.new("Monday", "")
entry_1.contents # => contents is empty

# 5 construct Contacts class
contacts = Contacts.new

# 5 initially returns empty contacts
contacts = Contacts.new
contact.view_phone_numbers # => []

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._