module Exercise
  module Fp2
    class MyArray < Array
      attr_reader :array

      def initialize(array)
        @array = array.dup.freeze
      end

      def my_each
        i = 0
        while i < @array.length
          yield(@array[i])
          i += 1
        end

        @array
      end

      # Написать свою функцию my_map
      def my_map; end

      # Написать свою функцию my_compact
      def my_compact; end

      # Написать свою функцию my_reduce
      def my_reduce; end
    end
  end
end
