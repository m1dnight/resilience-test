defmodule LoadyMcLoadface.Repo do
  use Ecto.Repo,
    otp_app: :loady_mc_loadface,
    adapter: Ecto.Adapters.Postgres
end
