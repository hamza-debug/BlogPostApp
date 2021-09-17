defmodule BlogPostWeb.LoginController do
  use BlogPostWeb, :controller

  alias BlogPost.{UserAccounts,Blog,UserAccounts.User,Authentication.Guardian, Blog.Post}


  def login(conn, %{"user" =>%{"email" => email, "password" => password}})do

    UserAccounts.authenticate_user(email, password)
    |> login_reply(conn)
  end

  def logout(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> redirect(to: "/login")

  end

  defp login_reply({:ok, user}, conn) do
    conn
    |>put_flash(:info, "Welcome")
    |> Guardian.Plug.sign_in(user)
    |> redirect(to: "/protected/#{user.id}/posts")
  end

  defp login_reply({:error, reason}, conn) do
    conn
    |>put_flash(:info, "Please SignUp else check your email or password is correct or not")
    |> redirect(to: "/login")
  end

end