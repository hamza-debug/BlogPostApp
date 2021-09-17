defmodule BlogPostWeb.UserLive.Index do
  use BlogPostWeb, :live_view

  alias BlogPost.UserAccounts
  alias BlogPost.UserAccounts.User

  @impl true
  def mount(_params, _session, socket) do

    changeset = Ecto.Changeset.change(%User{})
    {:ok,assign(socket, :changeset, changeset)}


  end

  def handle_event("validate", %{"user" => user_params}, socket)do
    changeset =
      %User{}
      |> UserAccounts.change_user(user_params)
      |> Map.put(:action, :validate)

    IO.inspect("==========changeset==========")
    IO.inspect(changeset)
    IO.inspect("==========changeset==========")

     {:noreply, assign(socket ,:changeset, changeset)}
  end

#  def handle_params(params, _url, socket)do
#    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
#  end


  def handle_event("save", %{"user" => user_params}, socket)do

    case UserAccounts.create_user(user_params)do
      {:ok, _user}->

        {:noreply,
          socket
          |> put_flash(:info, "You Registered Successfully")
          |> push_redirect( to: "/login")
        }
       {:error, %Ecto.Changeset{} = changeset}->
         {:noreply, assign(socket, changeset: changeset)}
    end

  end


end