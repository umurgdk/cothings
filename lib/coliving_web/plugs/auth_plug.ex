defmodule ColivingWeb.Plugs.AuthPlug do
  import Plug.Conn
  import Phoenix.Controller

  alias ColivingWeb.Router.Helpers

  def init(_) do
    # required
  end

  def call(conn, _) do
    if conn.assigns[:logged_in] do
      conn
    else
      conn
      |> put_flash(:error, "You need to login in order to manage")
      |> redirect(to: Helpers.session_path(conn, :index))
      |> halt()
    end
  end
end
