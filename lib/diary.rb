class Diary
  def initialize
    @entries = []
  end

  def view_todo_list(tasklist)
    tasklist.view
  end

  def add(entry)
    @entries << entry
  end

  def view_entries
    @entries
  end
  
  def best_entry_for_reading_time(wpm, minutes)
    # selects and returns a new array with readable entries
    readable_entries = @entries.select do |entry|
      entry.reading_time(wpm) <= minutes
    end

    best_entry = nil
    closest_best_entry = 0

    readable_entries.each do |entry|
      if entry.count_words > closest_best_entry
        best_entry = entry
        closest_best_entry = entry.count_words
      end

    end
    best_entry
  end

end