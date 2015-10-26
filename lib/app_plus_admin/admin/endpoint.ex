defmodule AppPlusAdmin.Admin.Endpoint do
  use Plug.Builder

  plug AppPlusAdmin.Admin.Static

  plug AppPlusAdmin.Plug.Dynamic

  plug AppPlusAdmin.Router
end
