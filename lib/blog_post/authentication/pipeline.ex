defmodule BlogPost.Authentication.Pipeline do
  @claims %{typ: "access"}

  use Guardian.Plug.Pipeline,
      otp_app: :blog_post,
      module: BlogPost.Authentication.Guardian,
      error_handler: BlogPost.Authentication.ErrorHandler

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true

end