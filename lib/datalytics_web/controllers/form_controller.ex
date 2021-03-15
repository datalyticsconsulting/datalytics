defmodule DatalyticsWeb.FormController do
  use DatalyticsWeb, :controller

  alias Datalytics.{Repo, Forms.Form}

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"messenger" => messenger}) do
    changeset = Form.changeset(%Form{})
    render(conn, "show.html", messenger: messenger, changeset: changeset)
  end

  def create(conn, %{
        "form" => %{"hours" => hours, "staff_holder" => selected_staff} = form_params
      })
      when not is_nil(selected_staff) do
    hours =
      selected_staff
      |> Enum.count()
      |> divide(hours)

    for staff <- selected_staff do
      %Form{}
      |> Form.changeset(form_params)
      |> Ecto.Changeset.put_change(:neb_staff, String.downcase(staff))
      |> Ecto.Changeset.put_change(:hours, hours)
      |> Repo.insert()
    end

    conn
    |> redirect(to: Routes.form_path(conn, :index))
  end

  def creaate(conn, form) do
    conn
    |> redirect(to: Routes.form_path(conn, :index))
  end

  defp divide(selected_count, hours) do
    hours = hours |> float_it()

    hours / selected_count
  end

  defp float_it(hours) do
    {hours, _} = Float.parse(hours)
    hours
  end

end
