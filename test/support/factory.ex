defmodule Quotes.Factory do
  use ExMachina.Ecto, repo: Quotes.Repo

  def subscriber_factory do
    %Quotes.Subscriber{
      first_name: "John",
      last_name: "Smith"
    }
  end
end
