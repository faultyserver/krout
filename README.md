# krout

Routing extensions for Kemal.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  krout:
    github: faultyserver/krout
```

## Usage

```crystal
require "krout"

class Auth
  def authenticate_user(env)
  end
end

# Scope routes with a `scope` block
scope "/admin" do
  # This becomes "/admin/dashboard".
  get "/dashboard" do
    "Hello"
  end

  # Filters are also scoped. This filter only applies to routes
  # prefixed with "/admin".
  before_get &->Auth.authenticate_user(Krout::Env)
end
```

See `/examples/*` for more detailed explanations of each feature.

## Development

The goal of this project is to add small, common features to Kemal's routing DSL with as little overhead as possible. As such, it's scope is small, and larger features likely won't be included.

Each feature should be defined in it's own file under `/src/krout` (e.g., `scope` is defined in `/src/krout/scope.cr`). If a feature encapsulates multiple smaller features, consider creating a subfolder. Ideally, users will be able to selectively include the features they need (e.g., `require "krout/scope"` versus just `require "krout"`).

Issues/PRs are welcome.

## Contributing

1. Fork it ( https://github.com/[your-github-name]/krout/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [faultyserver](https://github.com/faultyserver) Jon - creator, maintainer
