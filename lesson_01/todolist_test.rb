require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(5) }
    assert_raises(TypeError) { @list.add("test") }
  end

  def test_shovel_alias
    new_todo = Todo.new("Learn Minitest")
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add
    new_todo = Todo.new("Learn Minitest")
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo3, @list.item_at(-1))
    assert_raises(IndexError) { @list.item_at(5) }
    assert_raises(IndexError) { @list.item_at(-5) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
    assert_raises(IndexError) { @list.mark_done_at(5) }
  end

  def test_mark_undone_at
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_raises(IndexError) { @list.mark_undone_at(5) }
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
    assert_raises(IndexError) { @list.remove_at(5) }
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_two
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @todo2.done!

    assert_equal(output, @list.to_s)
  end

  def test_to_s_three
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.mark_all_done

    assert_equal(output, @list.to_s)
  end

  def test_each
    result = 0
    @list.each { |e| result += 1 }

    assert_equal(3, result)
  end

  def test_each_two
    assert_equal(@list, @list.each { |e| e.done! })
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)
  
    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  end 

  def test_find_by_title
    title = @todo1.title
    assert_equal(@todo1, @list.find_by_title(title))
  end

  def test_all_done
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.to_s, @list.all_done.to_s)
  end

  def test_all_not_done
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo2)
    list.add(@todo3)

    assert_equal(list.to_s, @list.all_not_done.to_s)
  end

  def test_mark_done
    @list.mark_done(@todo1.title)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_all_undone
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_all_undone
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

end