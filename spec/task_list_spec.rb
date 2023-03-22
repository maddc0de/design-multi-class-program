require 'task_list'

RSpec.describe TaskList do
  it "constructs" do
    todo = TaskList.new
  end

  it "returns all added tasks" do
    todo = TaskList.new
    todo.add("walk the doggos")
    todo.add("go for a run")
    expect(todo.view).to eq ["walk the doggos", "go for a run"]
  end

  it "returns a message when trying to remove a task that is not in the todo list" do
    todo = TaskList.new
    expect{todo.remove("go for a run")}.to raise_error "This is not in your todo list."
  end
end