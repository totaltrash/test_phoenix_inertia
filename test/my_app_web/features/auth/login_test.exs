defmodule MyAppWeb.Features.LoginTest do
  @moduledoc false
  use MyAppWeb.FeatureCase, async: true
  import Wallaby.Query

#   alias MyApp.UserFactory

  @email_field Query.text_field("Email")
  @password_field Query.text_field("Password")
  @login_button Query.button("Login")
  @password "supersecret"

#   defp with_user(_) do
#     {:ok, user: UserFactory.insert!(:user)}
#   end

  describe "when user not found" do
    @tag :wip
    test "user cannot login", %{session: session} do
      session
      |> visit("/login")
      |> assert_has(css("h1", text: "Welcome Back!"))
      |> fill_in(@email_field, with: "some@email.com")
      |> fill_in(@password_field, with: @password)
      |> click(@login_button)
      |> assert_has(css("[data-target='flash']", text: "Invalid email or password"))
    end
  end

  describe "when user exists" do
    # setup [:with_user]

    test "user can login", %{session: session, user: user} do
      session
      |> visit("/login")
      |> assert_has(css("h1", text: "Welcome Back!"))
      |> fill_in(@email_field, with: user.email)
      |> fill_in(@password_field, with: @password)
      |> click(@login_button)
      |> assert_has(css("h1", text: "Dashboard"))
    end
  end
end
