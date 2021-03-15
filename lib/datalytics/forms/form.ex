defmodule Datalytics.Forms.Form do
  use Ecto.Schema
  import Ecto.Changeset
  alias Datalytics.Repo

  alias Datalytics.Forms.Form
  require IEx

  schema "form" do
    field :district, :string
    field :school, :string
    field :interaction, :string
    field :service_type, :string
    field :service_detail, :string
    field :neb_staff, :string
    field :date, :date
    field :hours, :float
    field :teacher_attendance, :string
    field :staff, :string
    field :notes, :string
    field :teaching_series_step, :string
    field :month_sort, :float
    field :month_abb, :string
    field :hours_sp, :float
    field :service_n, :float
    field :unique_id, :float
    field :staff_holder, {:array, :string}, virtual: true
    field :service_day, :binary
    timestamps()
  end

  def changeset(form, attrs \\ %{}) do
    form
    |> cast(attrs, [
      :district,
      :school,
      :interaction,
      :service_type,
      :service_detail,
      :neb_staff,
      :date,
      :hours,
      :teacher_attendance,
      :staff,
      :staff_holder,
      :notes,
      :teaching_series_step,
      :month_sort,
      :month_abb,
      :hours_sp,
      :service_n
    ])
    |> validate_required([])
  end
end
