defmodule Datalytics.Repo.Migrations.CreateNebData do
  use Ecto.Migration

  def change do
    create table(:neb_data) do
      add :district, :string
      add :school, :string
      add :interaction, :string
      add :service_type, :string
      add :service_detail, :string
      add :ned_staff, :string
      add :date, :string
      add :hours, :float
      add :attendance, :string
      add :staff, :string
      add :notes, :string
      add :teaching_series_step, :string
      add :month_sort, :float
      add :month_abb, :string
      add :hours_sp, :float
      add :service_n, :float
      add :unique_id, :float

      timestamps()
    end
  end

    def alter do
      alter table(:neb_data) do

        create unique_index(:neb_data, [:unique_id])

      end
    end
end
