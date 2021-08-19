# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:disable Style/Documentation
# rubocop:disable Metrics/ClassLength
# rubocop:disable Layout/HeredocIndentation
# TodoList Test Sample Template

require 'simplecov'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
SimpleCov.start

require_relative 'todo_list'

class TodoListTest < MiniTest::Test
  def setup
    @todo1 = Todo.new('Buy milk')
    @todo2 = Todo.new('Clean room')
    @todo3 = Todo.new('Go to gym')
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new('Today\'s Todos')
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@list.size, 3)
  end

  def test_first
    assert_same(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_same(@todo1, @list.shift)
  end

  def test_shift_removes_todo_item
    original_size = @list.size
    @list.shift
    assert_equal(@list.size, original_size - 1)
  end

  def test_pop
    assert_same(@todo3, @list.pop)
  end

  def test_pop_removes_todo_item
    original_size = @list.size
    @list.pop
    assert_equal(@list.size, original_size - 1)
  end

  def test_method_done?
    refute(@list.done?)
    @list.each(&:done!)
    assert(@list.done?)
  end

  def test_type_error_raised_upon_adding_non_todo_object
    assert_raises(TypeError) { @list.add(5) }
    assert_raises(TypeError) { @list.add([]) }
    assert_raises(TypeError) { @list.add({}) }
    assert_raises(TypeError) { @list.add(TodoList.new('Accident Happy')) }
    assert_raises(TypeError) { @list.add('error_prone') }
  end

  def test_shovel_method_adds_todo_item
    original_length = @list.size
    @list << @todo1
    assert_equal(@list.size, original_length + 1)
  end

  def test_add_method_adds_todo_item
    original_length = @list.size
    @list.add(@todo1)
    assert_equal(@list.size, original_length + 1)
  end

  def test_item_at_with_bad_index
    assert_raises(IndexError) { @list.item_at(@list.size + 1) }
    assert_raises(IndexError) { @list.item_at(500) }
    assert_raises(IndexError) { @list.item_at(-5) }
    assert_raises(IndexError) { @list.item_at('0') }
  end

  def test_item_at_with_good_index
    assert_same(@todo1, @list.item_at(0))
    assert_same(@todo2, @list.item_at(1))
    assert_same(@todo3, @list.item_at(2))
  end

  def test_item_at_without_index
    assert_raises(ArgumentError) { @list.item_at }
  end

  def test_mark_done_at
    # good index
    refute(@list.item_at(0).done?)
    @list.mark_done_at(0)
    assert(@list.item_at(0).done?)
    # bad index
    assert_raises(IndexError) { @list.mark_done_at(50) }
    assert_raises(IndexError) { @list.mark_done_at(-1) }
    assert_raises(IndexError) { @list.mark_done_at('50') }
    # no index
    assert_raises(ArgumentError) { @list.mark_done_at }
  end

  def test_mark_undone_at
    # good index
    @todo1.done!
    assert(@list.item_at(0).done?)
    @list.mark_undone_at(0)
    refute(@list.item_at(0).done?)
    # bad index
    assert_raises(IndexError) { @list.mark_undone_at(50) }
    assert_raises(IndexError) { @list.mark_undone_at(-1) }
    assert_raises(IndexError) { @list.mark_undone_at('50') }
    # no index
    assert_raises(ArgumentError) { @list.mark_undone_at }
  end

  def test_done_bang
    @list.done!
    assert(@todo1.done?)
    assert(@todo2.done?)
    assert(@todo3.done?)
  end

  def test_remove_at
    # good index
    original_length = @list.size
    @list.remove_at(0)
    assert_equal(@list.size, original_length - 1)
    # bad index
    assert_raises(IndexError) { @list.remove_at(50) }
    assert_raises(IndexError) { @list.remove_at(-1) }
    assert_raises(IndexError) { @list.remove_at('50') }
    # no index
    assert_raises(ArgumentError) { @list.remove_at }
  end

  def test_remove_all_items_using_remove_at
    @list.remove_at(0) until @list.size.zero?
    assert_equal(@list.size, 0)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ==== Today's Todos ====
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_on_empty_list
    @list.remove_at(0) until @list.size.zero?
    output = "==== Today's Todos ====\n--Nothing to see here!--"
    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_item_complete
    @todo2.done!
    output = <<~OUTPUT.chomp
    ==== Today's Todos ====
    [ ] Buy milk
    [x] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_all_items_complete
    @list.done!
    output = <<~OUTPUT.chomp
    ==== Today's Todos ====
    [x] Buy milk
    [x] Clean room
    [x] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_each
    counter = 0
    @list.each do |task|
      assert_same(task, @todos[counter])
      counter += 1
    end
    # rubocop:disable Lint/UselessAssignment
    assert_equal(@list, @list.each { problems = 'nope!' })
    # rubocop:enable Lint/UselessAssignment
  end

  def test_select
    refute_same(@list, @list.select { true })
    all_items = @list.select { true }
    assert_equal(all_items.size, @list.size)
    assert_equal(0, @list.select { false }.size)
  end

  def test_all_done_with_no_finished_tasks
    assert_equal(TodoList.new("Completed Tasks from '#{@list.title}'"), @list.all_done)
  end

  def test_equals_todolist_with_same_items
    new_list = TodoList.new(@list.title)
    new_list << @todo1 << @todo2 << @todo3
    assert_equal(new_list, @list)
  end

  def test_equals_todolist_with_one_less_item
    new_list = TodoList.new(@list.title)
    new_list << @todo1 << @todo2
    refute_equal(new_list, @list)
  end

  def test_equals_todolist_with_one_more_item
    new_list = TodoList.new(@list.title)
    todo4 = Todo.new('Brush dog\'s teeth')
    new_list << @todo1 << @todo2 << @todo3 << todo4
    refute_equal(new_list, @list)
  end

  def test_equals_empty_todolist
    refute_equal(@list, TodoList.new('I am nothing'))
  end

  def test_all_done_with_all_finished_tasks
    @todo1.done!
    @todo2.done!
    @todo3.done!
    new_list = TodoList.new("Completed Tasks from '#{@list.title}'")
    new_list << @todo1 << @todo2 << @todo3
    assert_equal(new_list, @list.all_done)
  end

  def test_all_not_done_when_no_tasks_are_done
    new_list = TodoList.new("Uncompleted Tasks from '#{@list.title}'")
    new_list << @todo1 << @todo2 << @todo3
    assert_equal(@list.all_not_done, new_list)
  end

  def test_all_not_done_when_all_tasks_are_done
    new_list = TodoList.new("Uncompleted Tasks from '#{@list.title}'")
    @list.mark_all_done
    assert_equal(@list.all_not_done, new_list)
  end

  def test_all_not_done_when_some_tasks_are_done
    new_list = TodoList.new("Uncompleted Tasks from '#{@list.title}'")
    @todo1.done!
    @todo2.done!
    new_list << @todo3
    assert_equal(@list.all_not_done, new_list)
  end

  def test_find_by_title_with_full_task_name
    assert_same(@todo1, @list.find_by_title('Buy milk'))
  end

  def test_find_by_title_with_partial_task_name
    assert_same(@todo2, @list.find_by_title('Clean'))
  end

  def test_find_by_title_with_missing_task_name
    assert_equal("No match for task 'Oops'.", @list.find_by_title('Oops'))
  end

  def test_find_by_title_with_blank_name
    assert_equal("No match for task ''.", @list.find_by_title(''))
  end

  def test_find_by_title_without_name
    assert_raises(ArgumentError) { @list.find_by_title }
  end

  def test_mark_all_done
    @list.done! # why are there two methods?
    filtered_list = @list.all_done
    assert_equal(@list.tasks.size, filtered_list.tasks.size)
  end

  def test_mark_all_undone
    @list.each(&:done!)
    @list.mark_all_undone
    filtered_list = @list.all_not_done
    assert_equal(@list.tasks.size, filtered_list.tasks.size)
  end

  def test_mark_done_returns_true_on_success
    assert(@list.mark_done('Buy milk'))
  end

  def test_mark_done_by_correct_name
    @list.mark_done('Buy milk')
    assert(@todo1.done?)
  end

  def test_mark_done_by_incorrect_name
    refute(@list.mark_done('Super the glue'))
  end

  def test_mark_done_without_name
    assert_raises(ArgumentError) { @list.mark_done }
  end
end

# rubocop:enable Layout/HeredocIndentation
# rubocop:enable Style/FrozenStringLiteralComment
# rubocop:enable Style/Documentation
# rubocop:enable Metrics/ClassLength
