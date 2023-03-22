class Contacts
  def initialize
    @contacts = []
  end

  def view_phone_numbers
    @contacts
  end

  def get_phone_numbers(diary)
    diary.view_entries.each do |entry|
      entry.contents.split.each do |content|
        @contacts << content if content.match? /0\d{10}(?!\d)/
      end
    end
  end
end