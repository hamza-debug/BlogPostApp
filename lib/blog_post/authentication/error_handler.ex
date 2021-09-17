defmodule BlogPost.Authentication.ErrorHandler do
  import Plug.Conn
  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler

  def auth_error(conn, {type, _reason}, _opts) do
    IO.inspect("==========type===auth error=======")
    IO.inspect(type)
    IO.inspect("==========type==========")
    body = to_string(type)
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(401, body)
  end

end