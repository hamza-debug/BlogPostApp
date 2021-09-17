defmodule BlogPost.Authentication.Guardian do
  use Guardian, otp_app: :blog_post
  alias BlogPost.UserAccounts

  def subject_for_token(user, _claims) do

    IO.inspect("==========user==========")
    IO.inspect(user)
    IO.inspect("==========user==========")
    sub =  to_string(user.id)
    {:ok, sub }
  end

  def resource_from_claims(claims) do
    IO.inspect("==========claims==========")
    IO.inspect(claims)
    IO.inspect("==========claims==========")
    id = claims["sub"]
    user = UserAccounts.get_user!(id)
    {:ok, user}

  rescue
    Ecto.NoResultError -> {:error, :resource_not_found}
  end
end