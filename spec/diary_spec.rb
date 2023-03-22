require 'diary'

RSpec.describe Diary do
  it "constructs" do
    diary = Diary.new
  end

  it "returns an empty list when there are no diary entries added" do
    diary = Diary.new
    expect(diary.view_entries).to eq []
  end
end