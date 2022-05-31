class Element
  attr_reader :datum, :next

  def initialize(datum, next_el = nil)
    @datum = datum
    @next = next_el
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :simple_list

  def initialize
    @simple_list = []
  end

  def self.from_a(obj)
    list = SimpleLinkedList.new
    return list if !obj
    obj.reverse_each { |e| list.push(e) }
    list
  end

  def size
    simple_list.size
  end

  def empty?
    simple_list.empty?
  end

  def push(datum)
    simple_list << Element.new(datum, simple_list[-1])
  end

  def peek
    simple_list.empty? ? nil : head.datum
  end

  def head
    simple_list[-1]
  end

  def pop
    simple_list.pop.datum
  end

  def to_a
    simple_list.map(&:datum).reverse
  end

  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end
end
