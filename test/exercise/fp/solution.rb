module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]

      def rating(array)
        films = array.select do |film|
          !film['country'].nil? && film['country'].split(',').length >= 2 &&
            !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f.positive?
        end

        rating_sum = films.map { |film| film['rating_kinopoisk'].to_f }.reduce(:+)
        average_rating = rating_sum / films.size
      end

      def chars_count(array, threshold)
        films = array.select do |film|
          !film['rating_kinopoisk'].nil? &&
            film['rating_kinopoisk'].to_f >= threshold
        end

        films.reduce(0) { |sum, film| sum + film['name'].count('и') }
      end
    end
  end
end
