# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Datalytics.Repo.insert!(%Datalytics.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Pow.Ecto.Context.create(
  %{
    email: "jbone@example.com",
    role: "admin",
    password: "password",
    confirm_password: "password"
  },
  otp_app: :datalytics
)
