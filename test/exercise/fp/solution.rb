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

        films_raiting = films.map { |film| film['rating_kinopoisk'].to_f }
        films_raiting.reduce(:+) / films.size
      end

      def chars_count(array, threshold)
        films = array.select do |film|
          !film['rating_kinopoisk'].nil? &&
            film['rating_kinopoisk'].to_f >= threshold
        end

        films.map { |film| film['name'].count 'и' }.reduce(:+)
      end
    end
  end
end
