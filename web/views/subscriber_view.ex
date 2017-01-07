defmodule Quotes.SubscriberView do
  def render("index.json", %{subscribers: subscribers}) do
    %{
      subscribers: Enum.map(subscribers, &subscriber_json/1)
    }
  end

  def render("show.json", %{subscriber: subscriber}) do
    %{
      subscriber: subscriber_json(subscriber)
    }
  end

  def render("not_found.json", _assigns) do
    %{ error: "Subscriber not found" }
  end

  def render("validation_errors.json", _changeset) do
    %{ error: "Validation errors" }
  end

  def subscriber_json(subscriber) do
    %{
      id: subscriber.id,
      first_name: subscriber.first_name,
      last_name: subscriber.last_name,
      inserted_at: subscriber.inserted_at,
      updated_at: subscriber.updated_at
    }
  end
end
