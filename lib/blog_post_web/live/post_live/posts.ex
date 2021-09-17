defmodule BlogPostWeb.PostLive.Posts do
  use BlogPostWeb, :live_view

  alias BlogPost.Blog
  alias BlogPost.Blog.Post
  alias BlogPost.Authentication.Guardian

  @impl true
  def mount(_params, %{"guardian_default_token" => token}, socket) do

    IO.inspect("=========token=======")
    IO.inspect(token)
    IO.inspect("=========token=======")
    
    {:ok, claims} = Guardian.decode_and_verify(token)
    {:ok, user} = Guardian.resource_from_claims(claims)
    IO.inspect("=========user=======")
    IO.inspect(user)
    IO.inspect("=========user=======")
    socket
    {:ok, socket
          |> assign(:posts, list_posts(user.id))
          |> assign(:id, user.id)
    }
  end

  @impl true
  def handle_params(params, _url, socket) do
    
    IO.inspect("=========params")
    IO.inspect(params)
    IO.inspect("=========params=======")
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Post")
    |> assign(:post, Blog.get_post!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Post")
    |> assign(:post, %Post{})
  end

  defp apply_action(socket, :index, _params) do
    socket
  end


  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    post = Blog.get_post!(id)
    {:ok, _} = Blog.delete_post(post)

    {:noreply, assign(socket, :posts, list_posts(socket.assigns.user.id))}
  end

  defp list_posts (id) do
    Blog.get_current_user_post(id)
  end

  defp list_posts do
    Blog.list_posts
  end
end
