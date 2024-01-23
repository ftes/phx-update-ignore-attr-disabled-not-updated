defmodule DisabledBugWeb.DisabledBugLive do
  use DisabledBugWeb, :live_view

  def mount(_, _, socket) do
    {:ok, assign(socket, :disabled, false)}
  end

  def render(assigns) do
    ~H"""
    <input
      value={if @disabled, do: "disabled", else: "not disabled"}
      disabled={@disabled}
      phx-update="ignore"
      id="test-input"
      class="disabled:bg-gray-700 disabled:text-white"
    />
    <button phx-click="toggle" class="bg-green-100">Toggle</button>
    """
  end

  def handle_event("toggle", _, socket) do
    {:noreply, update(socket, :disabled, &(not &1))}
  end
end
