defmodule DisabledBug.Repo do
  use Ecto.Repo,
    otp_app: :disabled_bug,
    adapter: Ecto.Adapters.Postgres
end
