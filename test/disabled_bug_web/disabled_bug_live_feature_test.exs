defmodule DisabledBugLiveFeatureTest do
  use ExUnit.Case
  use Wallaby.Feature

  import Wallaby.Query, only: [css: 1, button: 1]

  feature "toggles to disabled and back", %{session: session} do
    visit(session, "/disabled-bug")
    Process.sleep(1000)
    refute_has(session, css("input[disabled]"))

    click(session, button("Toggle"))
    Process.sleep(1000)
    assert_has(session, css("input[disabled]"))

    click(session, button("Toggle"))
    Process.sleep(1000)
    refute_has(session, css("input[disabled]"))
  end
end
