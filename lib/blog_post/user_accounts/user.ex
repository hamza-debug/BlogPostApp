defmodule BlogPost.UserAccounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlogPost.Blog.Post

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string
    has_many :posts, Post

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :password])
    |> validate_required([:first_name, :last_name, :email, :password])
    |> unique_constraint(:email)
  end

  def register_changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :password])
    |> validate_required([:first_name, :last_name, :email, :password])
    |> unique_constraint(:email)
    |> encrypt_password()
  end



  defp encrypt_password(user) do
    with password <- fetch_field!(user, :password)do
      password_encrypt = Argon2.hash_pwd_salt(password)
      put_change(user, :password, password_encrypt)
    end
  end
end
