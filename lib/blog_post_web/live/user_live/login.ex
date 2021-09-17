defmodule BlogPostWeb.UserLive.Login do
  use BlogPostWeb, :live_view

  alias BlogPost.UserAccounts
  alias BlogPost.UserAccounts.User
  alias BlogPost.Authentication.Guardia

  @impl true
  def mount(_params, _session, socket) do
    changeset = Ecto.Changeset.change(%User{})
#    maybe_user = Guardian.Plug.current_resource(conn)
#    if maybe_user do
#    end

     IO.inspect("=========socket==from login mount=====")
     IO.inspect(socket)
     IO.inspect("=========socket=======")
    {:ok,assign(socket, :changeset, changeset)}


  end

#  def handle_event("validate", %{"user" => user_params}, socket)do
#    IO.inspect("hello from validate")
#    changeset =
#      %User{}
#      |> UserAccounts.change_user(user_params)
#      |> Map.put(:action, :validate)
#    {:noreply, assign(socket ,:changeset, changeset)}
#  end

  #  def handle_params(params, _url, socket)do
  #    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  #  end
#  def handle_event("login", %{"user" => %{"email" => email, "password" => password}}, socket)do
#    IO.inspect("hello")
#    UserAccounts.authenticate_user(email, password)
#    |> login_reply(socket)
#  end
#
#  def logout(socket, _) do
#    socket
#    |> Guardian.Plug.sign_out()
#    |> push_redirect(to: "/users/register")
#
#  end
#
#  defp login_reply({:ok, user}, socket) do
#    socket
#    |> put_flash(:info, "Welcome")
#    |> Guardian.Plug.sign_in(user)
#    |> push_redirect(to: "/protected/user/posts")
#  end
#
#  defp login_reply({:error, reason}, socket) do
#    socket
#    |>put_flash(:error, to_string(reason))
##    |> new(%{})
#  end


  end
