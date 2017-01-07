defmodule Quotes.SubscriberView do
  def render("index.json", %{subscribers: subscribers}) do
    %{
      subscribers: Enum.map(subscribers, &subscriber_json/1)
    }
  end

  def subscriber_json(subscriber) do
    %{
      first_name: subscriber.first_name,
      last_name: subscriber.last_name,
      inserted_at: subscriber.inserted_at,
      updated_at: subscriber.updated_at
    }
  end
end
