defmodule Quotes.Subscriber do
  use Quotes.Web, :model

  schema "subscribers" do
    field :first_name
    field :last_name

    timestamps()
  end
end
