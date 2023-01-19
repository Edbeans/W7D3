# Given a pattern and a string str, determine if str follows the same pattern.
​
# Example 1
​
# Input: pattern = "abba", str = "dog cat cat dog"
# Output: true
​
# Example 2
​
# Input: pattern = "abba", str = "dog cat cat fish"
# Output: false
​
# Example 3
​
# Input: pattern = "aaaa", str = "dog cat cat dog"
# Output: false
​
# Example 4
​
# Input: pattern = "abba", str = "dog dog dog dog"
# Output: false
​
# You may assume pattern contains only lowercase letters, and str contains lowercase letters that may be separated by a single space. Can you solve it in O(N) time and O(1) space?
​
require 'Set'
def pattern?(pattern, string)
    #[a, b, b, a] => [1, 2, 2, 1] <= [dog, cat, cat, dog] => true 
    # count = Hash.new { |h, k| h[k] = [] }
    # string.split(' ').each do |ele|
    #     count[]
    # set_pattern = Set.new
    # for ch in pattern
    #     set_pattern.add(ch) #{a, b}
    # end
    # set_str = Set.new
    # str.split.each do |word|
    #     set_str.add(word) # {dog, cat}
    # end
​
    # string.split.each do |word|
​
​
    # end
​
    
​
# end
​
#--------------------------------------------------------------------
​
# Given two strings S and T, return if they are equal when both are typed into empty text editors. In this case, # indicates a backspace character.
​
#     Example 1
    
#     Input: S = "ab#c", T = "ad#c"
#     Output: true
#     Explanation: Both S and T become "ac".
    
#     Example 2
    
#     Input: S = "ab##", T = "c#d#"
#     Output: true
#     Explanation: Both S and T become "".
    
#     Example 3
    
#     Input: S = "a##c", T = "#a#c"
#     Output: true
#     Explanation: Both S and T become "c".
    
#     Example 4
    
#     Input: S = "a#c", T = "b"
#     Output: false
#     Explanation: S becomes "c" while T becomes "b".
    
#     Note:
    
#     1. 1 <= S.length <= 200
#     2. 1 <= T.length <= 200
#     3. S and T only contain lowercase letters and '#' characters.
    
#     Can you solve it in O(N) time and O(1) space?
​
def equal_str?(s, t)
    #initial solution
    str_s = [] 
    str_t = []
    alphabets = *('a'..'z')
    s.split('').each do |ch|
        if alphabets.include?(ch)
            str_s << ch 
        end
        str_s.pop if ch == '#' and !str_s.empty? 
    end
    t.split('').each do |ch| 
        str_t << ch if alphabets.include?(ch)
        str_t.pop if ch == '#' and !str_t.empty?
    end
    puts str_s == str_t
end
equal_str?("ab#c", "ad#c") #true
equal_str?("ab##", "c#d#") #true 
equal_str?("a##c", "#a#c") #true
equal_str?("a#c", "b") #false
​
​
​
# Tree Sum
# Write a function, tree_sum, that takes in the root of a binary tree that contains number values. The function should return the total sum of all values in the tree.
​
# Example 1:
​
class Node
    attr_accessor :value, :left, :right
    def initialize(value)
        @value = value
        @left = nil
        @right = nil
    end
end
​
# a = Node.new(3)
# b = Node.new(11)
# c = Node.new(4)
# d = Node.new(4)
# e = Node.new(-2)
# f = Node.new(1)
​
# a.left = b
# a.right = c
# b.left = d
# b.right = e
# c.right = f
​
# #       3
# #    /    \
# #   11     4
# #  / \      \
# # 4   -2     1
​
# tree_sum(a) # -> 21
​
​
​
# def tree_sum(root)
#     queue = [root] #[3] 
#     sum = 0
#     while queue
#         #return 0 if node.value == nil
#         node = queue.pop #3
#         puts "node: #{node.value} " 
#         sum += node.value # sum = 3 
#         queue.unshift(node.left) unless node.left.nil? #[11, 3]
#         queue.unshift(node.right) unless node.right.nil? #[4, 11, 3] 
#     end
​
#     sum
    
# end
​
def tree_sum(node)
    return 0 if node.nil? 
    node.value + tree_sum(node.left) + tree_sum(node.right) 
end
​
# #       3
# #    /    \
# #   11     4
# #  / \      \
# # 4   -2     1
​
# p tree_sum(a) # -> 21
​
# Tree min value
# Write a function, tree_min_value, that takes in the root of a binary tree that contains number values. The function should return the minimum value within the tree.
​
# You may assume that the input tree is non-empty.
​
# # Example 1
​
# a = Node.new(3)
# b = Node.new(11)
# c = Node.new(4)
# d = Node.new(4)
# e = Node.new(-2)
# f = Node.new(1)
​
# a.left = b
# a.right = c
# b.left = d
# b.right = e
# c.right = f
​
#       3
#    /    \
#   11     4
#  / \      \
# 4   -2     1
​
​
# Example 2:
​
a = Node.new(5)
b = Node.new(11)
c = Node.new(3)
d = Node.new(4)
e = Node.new(14)
f = Node.new(12)
​
a.left = b
a.right = c
b.left = d
b.right = e
c.right = f
​
# #       5
# #    /    \
# #   11     3
# #  / \      \
# # 4   14     12
​
# tree_min_value(a) # -> 3
​
def tree_min_value(node)
    return 1000000000 if node.nil? 
    
    left = [node.value,tree_min_value(node.left)].min  
    right = [node.value,tree_min_value(node.right)].min
    [left, right].min 
end
p tree_min_value(a) # -> 3