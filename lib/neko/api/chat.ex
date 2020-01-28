defmodule Neko.Api.Chat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chats" do
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(chat, attrs) do
    chat
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
