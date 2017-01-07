defmodule Quotes.SubscriberControllerTest do
  use Quotes.ConnCase

  test "#index renders a list of subscribers" do
    conn = build_conn()
    subscriber = insert(:subscriber)

    conn = get conn, subscriber_path(conn, :index)

    # TODO: Maybe use https://github.com/danmcclain/voorhees
    assert json_response(conn, 200) == %{
      "subscribers" => [%{
                          "id" => subscriber.id,
                          "first_name" => subscriber.first_name,
                          "last_name" => subscriber.last_name,
                          "inserted_at" => NaiveDateTime.to_iso8601(subscriber.inserted_at),
                          "updated_at" => NaiveDateTime.to_iso8601(subscriber.updated_at)
                        }]
                  }
  end

  describe "#show" do
    test "renders a single subscriber" do
      conn = build_conn()
      subscriber = insert(:subscriber)

      conn = get conn, subscriber_path(conn, :show, subscriber.id)

      assert json_response(conn, 200) == %{
        "subscriber" => %{
          "id" => subscriber.id,
          "first_name" => subscriber.first_name,
          "last_name" => subscriber.last_name,
          "inserted_at" => NaiveDateTime.to_iso8601(subscriber.inserted_at),
          "updated_at" => NaiveDateTime.to_iso8601(subscriber.updated_at)
        }
      }
    end

    test "responds with a user not found error" do
      conn = build_conn()
      conn = get conn, subscriber_path(conn, :show, 34)

      assert json_response(conn, 404) == %{
        "error" => "Subscriber not found"
      }

    end
  end

  describe "#create" do
    test "renders the created subscriber" do
      conn = build_conn()
      subscriber = %{
        first_name: "Harry",
        last_name: "Potter"
      }

      conn = post conn, subscriber_path(conn, :create, subscriber: subscriber)
      response = json_response(conn, 201)

      record = Repo.get!(Quotes.Subscriber, response["subscriber"]["id"])

      assert response == %{
        "subscriber" => %{
          "id" => record.id,
          "first_name" => subscriber.first_name,
          "last_name" => subscriber.last_name,
          "inserted_at" => NaiveDateTime.to_iso8601(record.inserted_at),
          "updated_at" => NaiveDateTime.to_iso8601(record.updated_at)
        }
      }
    end
  end

  describe "#update" do
    test "updates a subscriber" do
      conn = build_conn()
      subscriber = insert(:subscriber)
      subscriber = %{subscriber | last_name: "Belafonte"}

      conn = patch conn, subscriber_path(conn, :update, subscriber.id), subscriber: Quotes.SubscriberView.subscriber_json(subscriber)
      response = json_response(conn, 200)

      assert response == %{
        "subscriber" => %{
          "id" => subscriber.id,
          "first_name" => subscriber.first_name,
          "last_name" => "Belafonte",
          "inserted_at" => NaiveDateTime.to_iso8601(subscriber.inserted_at),
          "updated_at" => response["subscriber"]["updated_at"]
        }
      }
    end
  end
end
