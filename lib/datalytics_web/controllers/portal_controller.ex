defmodule DatalyticsWeb.PortalController do
  use DatalyticsWeb, :controller

  def portal(conn, _params) do
    render(conn, "portal.html")
  end
end
