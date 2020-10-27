module Exercise
  module Fp2
    class MyArray < Array
      attr_reader :array

      def my_each
        i = 0
        while i < self.length
          yield(self[i])
          i += 1
        end

        self
      end

      def my_map
        result = MyArray.new
        self.my_reduce(result) { |result, item| result << yield(item) }
      end
      
      def my_compact
        result = MyArray.new
        self.my_each { |item| result << item unless item.nil? }

        result
      end

      def my_reduce(start_value=nil, &block)
        temp_arr = self.dup
        start_value = temp_arr.shift if start_value.nil?

        my_reduce_req(start_value, temp_arr, &block)
      end


      private 

      def my_reduce_req(accumulator, arr, &block)
        return accumulator if arr.empty?
        accumulator = yield(accumulator, arr.first)
        
        arr.shift
        my_reduce_req(accumulator, arr, &block)
      end
    end
  end
end
