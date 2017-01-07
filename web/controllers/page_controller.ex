defmodule Quotes.PageController do
  use Quotes.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
