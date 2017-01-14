defmodule Quotes.SubscriberController do
  use Quotes.Web, :controller
  use PhoenixSwagger

  alias Quotes.Subscriber

  swagger_model :index do
    description "Get the list of subscribers"
    responses 200, "The array of subscribers"
  end

  def index(conn, _params) do
    subscribers = Repo.all(Subscriber)
    render conn, "index.json", subscribers: subscribers
  end

  def show(conn, %{"id" => id}) do
    case Repo.get(Subscriber, id) do
      nil -> conn |> put_status(404) |> render("not_found.json")
      subscriber -> render conn, "show.json", subscriber: subscriber
    end
  end

  def create(conn, %{"subscriber" => subscriber_params}) do
    changeset = Subscriber.changeset(%Subscriber{}, subscriber_params)

    case Repo.insert(changeset) do
      {:ok, subscriber} -> conn |> put_status(201) |> render("show.json", subscriber: subscriber)
      {:error, changeset} -> conn |> put_status(400) |> render("validation_errors.json", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "subscriber" => subscriber_params}) do
    subscriber = Repo.get!(Subscriber, id)

    changeset = Subscriber.changeset(subscriber, subscriber_params)

    case Repo.update(changeset) do
      {:ok, subscriber} -> conn |> render("show.json", subscriber: subscriber)
      {:error, changeset} -> conn |> put_status(400) |> render("validation_errors.json", changeset: changeset)
    end
  end
end
