
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if @tail.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def size
    return 0 if @head.nil?

    node = @head
    count = 1
    until node.next_node.nil?
      count += 1
      node = node.next_node
    end
    count
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    return @head.value if index == 0

    node = @head.next_node
    count = 1
    while count < index
      node = node.next_node
      count += 1
    end
    node.value
  end

  def pop
    return "Cannot delete" if @head.nil?

    node = @head
    prev = nil

    until node.next_node.nil?
      prev = node
      node = node.next_node
    end
    prev.next_node == nil
    @tail = prev
  end

  def contains?(value)
    return true if @head.value == value || @tail.value == value

    node = @head
    until node.next_node.nil?
      return true if node.value == value
      node = node.next_node
    end
    false
  end

  def find(value)
    return nil if !contains?(value)

    index = 0
    node = @head
    while index < self.size
      return index if node.value == value
      index += 1
      node = node.next_node
    end
  end

  def to_s
    node = @head
    until node.next_node.nil?
      print "( #{node.value} ) -> "
      node = node.next_node
    end
    print "( #{node.value} ) -> nil"
  end
end

list = LinkedList.new
list.append(8)
list.append(7)
list.append(4)

list.to_s
