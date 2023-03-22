class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
  end

  def contents
    @contents
  end

  def count_words
    @contents.split.length
  end

  def reading_time(wpm)
    fail "wpm must be a positive number." if wpm == 0
    (count_words / wpm.to_f).ceil
  end
end