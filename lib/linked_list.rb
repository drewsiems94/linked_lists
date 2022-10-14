# frozen_string_literal: true

# A class for creating nodes to be stored in a linked list
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

# Class containing methods for working with a linked list
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
    self.each_w_index do |num, i|
      return num if i == index
    end
  end

  def pop
    return 'Cannot delete' if @head.nil?

    node = @head
    prev = nil

    until node.next_node.nil?
      prev = node
      node = node.next_node
    end
    prev.next_node = nil
    @tail = prev
  end

  def contains?(value)
    self.each_w_index do |num, i|
      return true if num == value
    end
    false
  end

  def find(value)
    self.each_w_index do |num, i|
      return i if num == value
    end
    nil
  end

  def to_s
    self.each_w_index do |num, i|
      print "( #{num} ) -> "
    end
    print 'nil'
  end

  def insert_at(value, index)
    prepend(value) if index.zero?

    node = @head
    prev = nil
    count = 0

    until count == index
      prev = node
      node = node.next_node
      count += 1
    end
    temp = Node.new(value)
    prev.next_node = temp
    temp.next_node = node
  end

  def remove_at(index)
    if index.zero?
      @head = @head.next_node
    else
      node = @head
      prev = nil
      count = 0
      until count == index
        prev = node
        node = node.next_node
        count += 1
      end
      if node.next_node.nil?
        self.pop
      else
        prev.next_node = node.next_node
      end
    end
  end

  def each_w_index
    node = @head
    index = 0
    while index < self.size
      yield(node.value, index)
      node = node.next_node
      index += 1
    end
  end
end
