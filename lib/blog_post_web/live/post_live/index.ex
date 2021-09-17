defmodule BlogPostWeb.PostLive.Index do
  use BlogPostWeb, :live_view

  alias BlogPost.Blog
  alias BlogPost.Blog.Post

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :posts, list_posts())}
  end

#  @impl true
#  def handle_params(params, _url, socket) do
#    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
#  end
  defp list_posts do
    Blog.list_posts()
  end
end
