module Exercise
  module Fp2
    class MyArray < Array
      attr_reader :array

      def initialize(array=nil)
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
      def my_map
      end

      # Написать свою функцию my_compact
      def my_compact; end

      # Написать свою функцию my_reduce
      def my_reduce(start_value=nil)
        if start_value == nil
          start_value = @array[0] 
          i = 1
        else
          i = 0
        end

        result = start_value
        while i < @array.length
          result = yield(result, @array[i])
          i += 1
        end
        
        result
      end

    end
  end
end
