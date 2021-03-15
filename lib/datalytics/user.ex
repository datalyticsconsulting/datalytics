defmodule Datalytics.Users do
  alias Datalytics.{Repo, Users.User}

  @type t :: %User{}

  @spec create_admin(map()) :: {:ok, t()} | {:error, Ecto.Changeset.t()}
  def create_admin(params) do
    %User{}
    |> User.changeset(params)
    |> User.changeset_role(%{role: "admin"})
    |> Repo.insert()
  end

  @spec create_supervisor(map()) :: {:ok, t()} | {:error, Ecto.Changeset.t()}
  def create_supervisor(params) do
    %User{}
    |> User.changeset(params)
    |> User.changeset_role(%{role: "supervisor"})
    |> Repo.insert()
  end

  @spec set_admin_role(t()) :: {:ok, t()} | {:error, Ecto.Changeset.t()}
  def set_admin_role(user) do
    user
    |> User.changeset_role(%{role: "admin"})
    |> Repo.update()
  end

  @spec is_admin?(t()) :: boolean()
  def is_admin?(%{role: "admin"}), do: true
  def is_admin?(_any), do: false

  @spec set_supervisor_role(t()) :: {:ok, t()} | {:error, Ecto.Changeset.t()}
  def set_supervisor_role(user) do
    user
    |> User.changeset_role(%{role: "supervisor"})
    |> Repo.update()
  end

  @spec is_supervisor?(t()) :: boolean()
  def is_supervisor?(%{role: "supervisor"}), do: true
  def is_supervisor?(_any), do: false
end
