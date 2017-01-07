defmodule Quotes.SubscriberController do
  use Quotes.Web, :controller

  alias Quotes.Subscriber

  def index(conn, _params) do
    subscribers = Repo.all(Subscriber)
    render conn, "index.json", subscribers: subscribers
  end
end
