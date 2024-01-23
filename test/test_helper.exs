ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(DisabledBug.Repo, :manual)
Application.put_env(:wallaby, :base_url, DisabledBugWeb.Endpoint.url())
{:ok, _} = Application.ensure_all_started(:wallaby)
