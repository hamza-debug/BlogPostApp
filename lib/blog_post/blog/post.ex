defmodule BlogPost.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlogPost.UserAccounts

  schema "posts" do
    field :name, :string
    field :body, :string
    belongs_to :user, UserAccounts.User

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :name])
    |> validate_required([:body, :name])
  end
end
