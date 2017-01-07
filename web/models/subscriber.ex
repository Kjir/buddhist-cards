defmodule Quotes.Subscriber do
  use Quotes.Web, :model

  schema "subscribers" do
    field :first_name
    field :last_name

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name])
  end
end
