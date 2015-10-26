defmodule AppPlusAdmin.Plug.Forward do
  @moduledoc """
  Simple forwarder
  """

  def init(default) do
    default
  end

  def call(conn = %Plug.Conn{path_info: path_info}, opts) do
    fwd_segments = opts[:switch]
    {match, _} = Enum.split(path_info, length(fwd_segments))
    IO.inspect({match, fwd_segments})
    case fwd_segments do
      ^match -> opts[:forward].call(conn, opts) |> Plug.Conn.halt
      _ -> conn
    end
  end
end
