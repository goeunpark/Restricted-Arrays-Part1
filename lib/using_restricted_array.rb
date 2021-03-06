require 'awesome_print'
require 'pry'
require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil


def length(array)
  size = 20
  count = 0

  size.times do |i|
    if array[i] != nil
      count += 1
    else
      return count
    end
  end
end

def print_array(array)
  size = 20
  print_array = ""

  size.times do |i|
    if array[i] != nil
      print_array << array[i].to_s + " "
    end
  end
  return puts print_array
end

def search(array, length, value_to_find)
  length.times do |i|
    if array[i] == value_to_find
      return true
    end
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  largest = array[0]
  length.times do |i|
    if array[i] > largest
      largest = array[i]
    end
  end
  return largest
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  smallest = array[0]
  length.times do |i|
    if array[i] < smallest
      smallest = array[i]
    end
  end
  return smallest
end

# Reverses the values in the integer array in place
def reverse(array, length)
  low = 0
  high = length-1
  while low < high
    x = array[low]
    array[low] = array[high]
    array[high] = x
    low += 1
    high -= 1
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  if length == 1 && array[0] == value_to_find
    return true
  end

  low = 0
  high = length-1
  while low < high
    mid = (low + high)/2
    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      high = mid-1
    else array[mid] < value_to_find
      low = mid+1
    end
  end

  if array[low] == value_to_find
    return true
  end
  return false
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2) since to find the correct value to be in a given location,
# all the remaining elements are visited. This is done for each location.
# (nested loop of size n each)
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---

ap reverse([47, 43, 54, 32, 10], 5)
