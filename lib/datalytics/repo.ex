defmodule Datalytics.Repo do
  use Ecto.Repo,
    otp_app: :datalytics,
    adapter: Ecto.Adapters.Postgres
end
