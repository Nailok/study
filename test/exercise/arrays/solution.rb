module Exercise
  module Arrays
    class << self
      def replace(array)
        return nil if array.empty?

        max_elem = max(array)
        array.map { |item| item.positive? ? max_elem : item }
      end

      def max(array)
        array.reduce(array[0]) { |max, item| max < item ? item : max }
      end

      def search(array, query)
        return -1 if array.empty?

        binary_search(array, query, 0, array.length - 1)
      end

      def binary_search(array, query, left, right)
        mid = left + (right - left) / 2

        return mid if array[mid] == query

        return -1 if left >= right

        return binary_search(array, query, left, mid - 1) if array[mid] > query

        binary_search(array, query, mid + 1, right)
      end
    end
  end
end
