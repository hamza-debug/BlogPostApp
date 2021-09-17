defmodule BlogPost.Repo do
  use Ecto.Repo,
    otp_app: :blog_post,
    adapter: Ecto.Adapters.Postgres
end
