defmodule DisabledBugLiveTest do
  use DisabledBugWeb.ConnCase

  import Phoenix.LiveViewTest

  test "toggles to disabled and back", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/disabled-bug")
    refute has_element?(view, "input[disabled]")

    view |> element("button", "Toggle") |> render_click()
    assert has_element?(view, "input[disabled]")

    view |> element("button", "Toggle") |> render_click()
    refute has_element?(view, "input[disabled]")
  end
end
