require 'diary_entry'

RSpec.describe DiaryEntry do
  it "constructs" do
    entry_1 = DiaryEntry.new("Monday", "Hello" * 200)
  end
  
  it "returns contents" do
    entry_1 = DiaryEntry.new("Monday", "Hello" * 200)
    expect(entry_1.contents).to eq "Hello" * 200
  end

  describe "count_words method" do
    it "returns zero if contents is empty" do
      entry = DiaryEntry.new("Monday", "")
      expect(entry.count_words).to eq 0
    end

    it "returns number of words in the contents" do
      entry = DiaryEntry.new("Monday", "Hello " * 200)
      expect(entry.count_words).to eq 200
    end
  end

  describe "reading_time method" do
    it "fails when wpm is zero" do
      entry = DiaryEntry.new("Monday", "hello")
      expect { entry.reading_time(0)}.to raise_error "wpm must be a positive number."
    end

    it "returns zero if contents is empty" do
      entry = DiaryEntry.new("Monday", "")
      expect(entry.reading_time(200)).to eq 0
    end

    it "returns the reading time for the contents" do
      entry = DiaryEntry.new("Monday", "Hello " * 350)
      expect(entry.reading_time(200)).to eq 2  # should round num up
    end
  end


end