defmodule Quotes.SubscriberControllerTest do
  use Quotes.ConnCase

  test "#index renders a list of subscribers" do
    conn = build_conn()
    subscriber = insert(:subscriber)

    conn = get conn, subscriber_path(conn, :index)

    assert json_response(conn, 200) == %{
      "subscribers" => [%{
        "first_name" => subscriber.first_name,
        "last_name" => subscriber.last_name,
        "inserted_at" => Ecto.DateTime.to_iso8601(todo.inserted_at),
        "updated_at" => Ecto.DateTime.to_iso8601(todo.updated_at)
      }]
    }
  end
end
