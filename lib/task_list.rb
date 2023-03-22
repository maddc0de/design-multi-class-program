class TaskList
  def initialize
    @todo_list = []
  end

  def add(task) 
    @todo_list << task
  end

  def view
    @todo_list
  end

  def remove(task)
    fail "This is not in your todo list." if !@todo_list.include? task
    @todo_list.delete(task)
  end
end