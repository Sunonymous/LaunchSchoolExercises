# ToDoList Example Application

class Todo
  DONE_MARKER    = 'x'
  UNDONE_MARKER  = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title       = title
    @description = description
    @done        = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title, :tasks

  def initialize(title)
    @title = title.freeze
    @tasks = []
  end

  def ==(other)
    self.title == other.title &&
      self.tasks.size == other.tasks.size &&
      each { |task| other.tasks.include?(task) }
  end

  def add(task) # Task should be Todo object
    if Todo === task
      self.tasks.push(task) 
    else
      raise TypeError, "<task> to add must be Todo object."
    end
  end
  alias_method :<<, :add

  def done?
    @tasks.all? { |task| task.done? }
  end

  def item_at(idx)
    raise IndexError, "Task index out of range." unless valid_index?(idx)
    @tasks[idx]
  end

  def mark_done_at(idx)
    raise IndexError, "Task index out of range." unless valid_index?(idx)
    @tasks[idx].done!
  end

  def mark_undone_at(idx)
    raise IndexError, "Task index out of range." unless valid_index?(idx)
    @tasks[idx].undone!
  end

  def remove_at(idx)
    raise IndexError, "Task index out of range." unless valid_index?(idx)
    @tasks.delete_at(idx)
  end

  def done!
    @tasks.each { |task| task.done! }
  end

  def to_s
    txt = "==== #{@title} ====\n"
    @tasks.each do |task| 
      txt << task.to_s
      txt << "\n" unless task == self.last
    end
    txt << "--Nothing to see here!--" if @tasks.empty?
    txt
  end

  def each # passed implicit block
    raise LocalJumpError, "This method requires an implicit block." unless block_given?
    @tasks.each { |task| yield task }
    self
  end

  def select # passed implicit block
    raise LocalJumpError, "This method requires an implicit block." unless block_given?
    results = []
    each do |task|
      results << task if yield(task)
    end
    new_list = TodoList.new("Sublist of '#{self.title}'")
    results.each { |task| new_list << task }
    new_list
  end

  def find_by_title(task_title)
    matches = task_title.empty? ? [] : select { |task| task.title.include?(task_title) }
    matches.to_a.empty? ? "No match for task '#{task_title}'." : matches.first
  end

  def all_done
    new_list = TodoList.new("Completed Tasks from '#{self.title}'")
    each { |task| new_list.add(task) if task.done? }
    new_list
  end

  def all_not_done
    new_list = TodoList.new("Uncompleted Tasks from '#{self.title}'")
    each { |task| new_list.add(task) unless task.done? }
    new_list
  end

  def mark_done(task) # returns true / false on success
    found = false
    each do |tsk|
      if tsk.title == task
        found = true
        tsk.done!
        puts "Task '#{tsk.title}' marked completed."
      end
    end
    puts "No task with title '#{task}' found." unless found
    found
  end

  def mark_all_done
    each { |task| task.done! }
  end

  def mark_all_undone
    each { |task| task.undone! }
  end

  def size;  @tasks.size;  end
  def first; @tasks.first; end
  def last;  @tasks.last;  end
  def shift; @tasks.shift; end
  def pop;   @tasks.pop;   end
  def to_a;  @tasks.clone; end

  private

  def valid_index?(idx)
    idx.is_a?(Integer) && (idx.positive? || idx.zero?) && idx < @tasks.size
  end
end

# a Loooot of testing code
# vvv

# system('clear')
# todo1 = Todo.new('Practice Doodling on Wall')
# todo2 = Todo.new('Doodle on Neighbor\'s House')
# todo3 = Todo.new('Post Bail')
# list = TodoList.new('This Week in Tasks')

# list.add(todo1)
# list.add(todo2)
# list.add(todo3)
# list << todo1
# list << todo2
# list << todo3
# list.add(1)

# puts " Size: #{list.size}"
# puts "First: #{list.first}"
# puts " Last: #{list.last}"
# p list.to_a
# puts " Done: #{list.done?}"
# list.mark_done_at(0)
# list.mark_undone_at(0)
# list.done!
# puts list.shift
# puts list.pop
# list.remove_at(1)
# puts list.item_at(0)
# puts list.item_at(1)
# puts list.item_at(2)
# puts list.to_s
# list.each { |task| puts task }
# list.mark_done_at(1)
# finished = list.select { |task| task.done? }
# puts finished.to_s

# Assignment 12
# p list.find_by_title('Skip Merrily') # not present
# p list.find_by_title('Practice Doodling on Wall')
# list.mark_done_at(2)
# list.mark_done_at(0)
# puts list.all_done
# puts list.all_not_done
# list.mark_done('Go Fishing')
# list.mark_done('Post Bail')
# list.mark_all_done
# list.mark_all_undone
# puts list.all_not_done
