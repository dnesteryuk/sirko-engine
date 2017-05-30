defmodule Sirko.Plugs.Cors do
  @moduledoc """
  Defines CORS headers to allow the client to requests the app.
  """

  import Plug.Conn

  @allowed_http_methods "get"

  def init(opts), do: opts

  def call(conn, _ \\ []) do
    conn
    |> put_resp_header("access-control-allow-origin", client_url())
    |> put_resp_header("access-control-allow-methods", @allowed_http_methods)
    |> put_resp_header("access-control-allow-credentials", "true")
  end

  defp client_url do
    # TODO: find a better way to pass parameters to the plug.
    :sirko
    |> Application.get_env(:web)
    |> Keyword.get(:client_url)
  end
end
