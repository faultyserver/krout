require "kemal"
require "krout"

def authenticate_user

scope "/admin" do
  # This `before_get` action only gets called for
  # Use `Krout::Env` as an alias for `HTTP::Server::Context`. This is the type
  # of the `env` argument in lines like `get "/" do |env|`.
  before_get &->authenticate_user(Krout::Env)

  # This will become `/admin/dashboard`.
  get "/dashboard" do |env|
    env.response.content_type = "application/html"
    # ...
  end
end
