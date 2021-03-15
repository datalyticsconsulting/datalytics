defmodule Datalytics.Repo.Migrations.CreateNebData do
  use Ecto.Migration

  def change do
    create table(:neb_data) do

      timestamps()
    end

  end
end
