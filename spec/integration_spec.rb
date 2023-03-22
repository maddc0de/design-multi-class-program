require 'contacts'
require 'diary_entry'
require 'diary'
require 'task_list'

RSpec.describe "integration" do
  describe "view to do list behaviour" do
    it "returns list of all tasks added" do
      todo = TaskList.new
      diary = Diary.new
      todo.add("walk the doggos")
      todo.add("go for a run")
      expect(diary.view_todo_list(todo)).to eq ["walk the doggos", "go for a run"]
    end

    it "returns list of all tasks except the task that has been removed" do
      todo = TaskList.new
      diary = Diary.new
      todo.add("walk the doggos")
      todo.add("go for a run")
      todo.remove("go for a run")
      expect(diary.view_todo_list(todo)).to eq ["walk the doggos"]
    end
  end

  describe "view entries behaviour" do
    it "returns list of all entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "Hello Diary ")
      entry_2 = DiaryEntry.new("Monday", "Bye Diary ")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.view_entries).to eq [entry_1, entry_2]
    end

  end

  describe "best entry for reading time behaviour" do
    it "returns longest entry that user can read within readable time" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "Hello " * 100)
      entry_2 = DiaryEntry.new("Tuesday", "Bye " * 300)
      best_entry = DiaryEntry.new("Wednesday", "Thanks " * 150)
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(best_entry)
      expect(diary.best_entry_for_reading_time(200, 1)).to eq best_entry
    end

  end

  it "returns a list of all phone numbers from diary entries" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("Monday", "Hello Diary " + "07123456789 ")
    diary.add(entry_1)
    contacts = Contacts.new
    contacts.get_phone_numbers(diary)
    expect(contacts.view_phone_numbers).to eq ["07123456789"]
  end

end