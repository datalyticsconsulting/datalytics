defmodule DatalyticsWeb.DashController do
  use DatalyticsWeb, :controller

  def dash(conn, _params) do
    render(conn, "dash.html")
  end
end
