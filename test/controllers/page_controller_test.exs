defmodule Quotes.PageControllerTest do
  use Quotes.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "id=\"buddhist-quotes\""
  end
end
