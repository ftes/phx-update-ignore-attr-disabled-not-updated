defmodule DisabledBugWeb.DisabledBugLive do
  use DisabledBugWeb, :live_view

  def mount(_, _, socket) do
    {:ok, assign(socket, :disabled, false)}
  end

  def render(assigns) do
    ~H"""
    <input
      disabled={@disabled}
      placeholder={@disabled}
      phx-update="ignore"
      value={inspect(@disabled)}
      id="test-input"
    />
    <button phx-click="toggle">Toggle</button>
    """
  end

  def handle_event("toggle", _, socket) do
    {:noreply, update(socket, :disabled, &(not &1))}
  end
end
