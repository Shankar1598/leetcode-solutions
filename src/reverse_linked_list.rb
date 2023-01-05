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
end
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  if head.next
    tail = reverse_list(head.next)
    puts "tail returned: #{tail.val}. Current head: #{head.val}"
    tail.next = head
    return tail.next
  else
    puts "last element: #{head.val}"
    return head
  end
end

def each_item item
  yield item
  while (item = item.next)
    yield item
  end
end
def get_input array
  input = nil
  last_item = nil
  array.each do |i|
    new_item = ListNode.new(i, nil)
    if input.nil?
      input = new_item
    else
      last_item.next = new_item
    end
    last_item = new_item
  end
  input
end

reverse_list(get_input([1,2,3,4,5])).ps

