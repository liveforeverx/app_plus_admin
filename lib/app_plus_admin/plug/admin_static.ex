defmodule AppPlusAdmin.Admin.Static do
  @moduledoc """
  This plug allows to dynamically change the root directory
  for statically delivered assets.

  Plug.Static has a shortcoming: It won't change the root
  directory at runtime or per configuration on start without
  recompiling.
  """

  require Plug

  def init(default), do: default

  def call(conn = %Plug.Conn{path_info: path_info}, _default) do
    IO.inspect("check: admin static")
    # if the requested resource is "/" (empty "path_info")
    # we assume the user wants "/index.html"
    conn = case path_info do
      [] -> %{conn | path_info: ["index.html"]}
      _ -> conn
    end

    root = :code.priv_dir(:app_plus_admin)
    conn |> Plug.Static.call(Plug.Static.init(
      at: "/admin",
      from: Application.get_env(:app_plus_admin, :admin_root),
      gzip: true))
  end
end
