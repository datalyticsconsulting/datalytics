defmodule DatalyticsWeb.Pow.Routes do
  use Pow.Phoenix.Routes
  alias DatalyticsWeb.Router.Helpers, as: Routes

  def after_sign_out_path(conn), do: Routes.page_path(conn, :index)

  def after_sign_in_path(conn), do: Routes.dash_path(conn, :dash)
end
