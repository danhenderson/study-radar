defmodule Study.Admin.DashboardController do
  use Study.Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
