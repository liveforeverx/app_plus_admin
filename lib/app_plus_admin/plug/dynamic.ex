defmodule AppPlusAdmin.Plug.Dynamic do
  use Plug.Builder

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_app_plus_admin_key",
    signing_salt: "CUXezb4u"
end
