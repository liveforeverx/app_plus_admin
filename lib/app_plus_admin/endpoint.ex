defmodule AppPlusAdmin.Endpoint do
  use Phoenix.Endpoint, otp_app: :app_plus_admin

  socket "/socket", AppPlusAdmin.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug AppPlusAdmin.Plug.Forward,
    switch: ["admin"],
    forward: AppPlusAdmin.Admin.Endpoint

  plug AppPlusAdmin.Plug.Static

  plug AppPlusAdmin.Plug.Dynamic

  plug AppPlusAdmin.Router
end
