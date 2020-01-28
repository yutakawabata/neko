defmodule NekoWeb.ChatController do
  use NekoWeb, :controller

  alias Neko.Api
  alias Neko.Api.Chat

  action_fallback NekoWeb.FallbackController

  def chatlog(conn, _params) do
    chats = Api.list_chats()
    render(conn, "index.json", chats: chats)
  end

  def recv(conn,_chat) do
    chat_params = 
      %{"text" => conn.params["text"]}
    case Api.recv_chat(chat_params) do
      {:ok, chat} -> 
        chats = Api.list_chats()
        render(conn, "index.json", chats: chats)

      {:error, %Ecto.Changeset{} = changeset} ->
        send_resp(conn, 502, "Oops, failed sending!")
    end
  end

  def show(conn, _params) do
    conn
    |> json%{message: "hello"}
  end
end