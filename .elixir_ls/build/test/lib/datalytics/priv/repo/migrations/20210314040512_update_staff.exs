defmodule Datalytics.Repo.Migrations.UpdateStaff do
  use Ecto.Migration

  def change do
    alter table(:form) do
      add :neb_staff, :string
      add :service_day, :binary
    end
  end
end
