defmodule DatalyticsWeb.PageController do
  use DatalyticsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
