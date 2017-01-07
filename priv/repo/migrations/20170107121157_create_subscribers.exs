defmodule Quotes.Repo.Migrations.CreateSubscribers do
  use Ecto.Migration

  def change do
    create table(:subscribers) do
      add :first_name, :string
      add :last_name, :string

      timestamps()
    end
  end
end
