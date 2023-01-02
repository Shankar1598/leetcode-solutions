# Definition for singly-linked list.
# require "byebug"
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  if list1.nil?
    return list2
  end
  if list2.nil?
    return list1
  end
  if list1 > list2
    puts "list1 > list2"
    final_list = list2
    list_to_insert = list1
  else
    puts "list1 <= list2"
    final_list = list1
    list_to_insert = list2
  end


  each_item(list_to_insert) do |item_to_merge|
    each_item(final_list) do |existing_item|
      if existing_item.next.nil?
        # this is the last item of the list, so insert next to it
        existing_item.next = ListNode.new(item_to_merge.val, existing_item.next)
        break
      elsif existing_item == item_to_merge
        existing_item.next = ListNode.new(item_to_merge.val, existing_item.next)
        break
      elsif (existing_item.next > item_to_merge)
        existing_item.next = ListNode.new(item_to_merge.val, existing_item.next)
        break
      end
    end
  end
  final_list
end

ListNode.class_eval do
  def > another_node
    self.val > another_node.val
  end
  def <= another_node
    self.val <= another_node.val
  end
  def print ref
    puts "#{ref}: #{self.val}"
    self.next&.print(ref)
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

(merge_two_lists(get_input([1,2,4]), get_input([1,3,4]))).print("OP")
