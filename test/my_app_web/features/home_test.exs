defmodule MyAppWeb.Features.HomeTest do
  @moduledoc false
  use MyAppWeb.FeatureCase, async: true
  import Wallaby.Query

  @post_button Query.button("Send post", [count: 2, at: 1])

  describe "smoke" do
    test "home and post", %{session: session} do
      session
      |> visit("/")
      |> assert_has(css("h1", text: "Home"))
      |> click(@post_button)
      |> assert_has(css(".toast", text: "Info flash"))
    end
  end
end
