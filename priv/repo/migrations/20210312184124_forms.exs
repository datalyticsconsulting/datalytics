defmodule Datalytics.Repo.Migrations.Forms do
  use Ecto.Migration

  def change do
    create table(:form) do
      timestamps()
      add :neb_staff, :string
      add :school, :string
      add :date, :date
      add :hours, :float
      add :teacher_attendance, :string
      add :service_type, :string
      add :service_detail, :string
      add :staff, :string
      add :notes, :string
      add :title, :string
      add :teaching_series_step, :string
      add :service_day, :binary
      add :district, :string
      add :interaction, :string
      add :month_sort, :float
      add :month_abb, :string
      add :hours_sp, :float
      add :service_n, :float
      add :unique_id, :float
    end

    create unique_index(:form, [:unique_id])
  end
end
