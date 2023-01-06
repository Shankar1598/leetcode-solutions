=begin
The normal solution seems to be faster than the recursive one, and more memory optimized as well
Solution 4 seems to be the best
=end



# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
    def ps
      puts "#{self.val}"
      self.next&.ps
    end
    def to_s
      "ListNode: #{val}"
    end
end
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  # Solution 1
  # new_head, _new_tail = reverse_list_recursive(head)
  # return new_head

  # Solution 2
  # array = []
  # each_item(head) do |item|
  #   array << item.val
  # end
  # return get_input(array.reverse)

  # Solution 3 (best among the 1st 3 solutions)
  # curser = head
  # previous_curser = nil
  # reversed_head = head

  # loop do
  #   break if curser.nil?
  #   # puts "curser: #{curser}, previous_curser: #{previous_curser}, reversed_head: #{reversed_head}"
  #   reversed_head = curser
  #   next_curser = curser.next
  #   reversed_head.next = previous_curser
  #   previous_curser = curser
  #   curser = next_curser
  # end
  # return reversed_head


  # Solution 4 (copied)
  array = []
  each_item(head) do |item|
    array << item.val
  end
  node = head
  while(array.any?) do
    node.val = array.pop
    node = node.next
  end
  return head
end

def reverse_list_recursive(head)
  # puts "Current head: #{head.val}"
  next_element = head.next

  # since this is going to be the last element, remove the next value
  head.next = nil

  if next_element
    new_head, new_tail = reverse_list_recursive(next_element)
    # puts "received partials: #{new_head}, #{new_tail}"
    # attaching the old head as the last item
    new_tail.next = head

    # puts "new_head: #{new_head.val}, new_tail: #{new_tail.next.val}"
    # new_tail.next will become the new tail as the last element is the tail
    # return new_head, new_tail
    return new_head, new_tail.next
  else
    # puts "last element: #{head.val}"
    # puts "new_head: #{head.val}, new_tail: #{head.val}"
    # new_head = head
    # new_tail = head
    # return new_head, new_tail
    return head, head
  end
end

def each_item item
  yield item
  while (item = item.next)
    yield item
  end
end
def get_input array
  head = nil
  last_item = nil
  array.each do |i|
    new_item = ListNode.new(i, nil)
    if head.nil?
      head = new_item
    else
      last_item.next = new_item
    end
    last_item = new_item
  end
  head
end

reverse_list(get_input([1,2,3])).ps

