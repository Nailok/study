module Inatra
  @routes = {}

  class << self
    def routes(&block)
      instance_eval(&block)
    end

    def call(env)
      method = env['REQUEST_METHOD'].to_s.downcase
      path = env['PATH_INFO'].to_s.downcase

      return [404, {}, ['Not Found']] unless @routes[method].key?(path)

      @routes[method][path]
    end

    def method_missing(method, path)
      method = method.to_s.downcase
      path = path.to_s.downcase

      @routes[method] = {} if @routes[method].nil?
      @routes[method][path] = yield
    end

    def respond_to_missing?(method, path)
      method = method.to_s.downcase
      path = path.to_s.downcase

      @routes.key?(method) && @routes[method].key?(path) || super
    end
  end
end
