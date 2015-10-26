defmodule AppPlusAdmin.AdminController do
  use AppPlusAdmin.Web, :admin_controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
