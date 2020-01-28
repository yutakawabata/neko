defmodule Neko.Api do

  import Ecto.Query, warn: false
  alias Neko.Repo
  alias Neko.Api.Chat

  def list_chats do
    Repo.all(Chat)
  end

  def get_chat!(id), do: Repo.get!(Chat, id)

  def recv_chat(attrs \\ %{}) do
    %Chat{}
    |> Chat.changeset(attrs)
    |> Repo.insert()
  end

end
