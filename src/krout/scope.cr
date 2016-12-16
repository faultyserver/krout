module Krout
  # Make Proc shorthands a little nicer.
  # This allows for things like
  # before_get &->authenticate_user(Krout::Env)
  alias Env = HTTP::Server::Context

  struct Scope
    property scope_path : String

    def initialize(@scope_path : String); end

    # Pass through HTTP and Filter methods, prepending the scope's path.
    {% for method in HTTP_METHODS %}
      def {{method.id}}(path, &block : HTTP::Server::Context -> _)
        ::{{method.id}}(@scope_path + path, &block)
      end
    {% end %}

    {% for type in ["before", "after"] %}
      {% for method in FILTER_METHODS %}
        def {{type.id}}_{{method.id}}(path = "*", &block : HTTP::Server::Context -> _)
          ::{{type.id}}_{{method.id}}(@scope_path + path, &block)
        end
      {% end %}
    {% end %}
  end
end

def scope(path : String | Symbol, &block)
  with Krout::Scope.new(path) yield
end
