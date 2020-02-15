defmodule NekoWeb.ChatView do
  use NekoWeb, :view
  alias NekoWeb.ChatView

  def render("index.json", %{chats: chats}) do
    render_many(chats, ChatView, "chat.json")
  end

  def render("show.json", %{chat: chat}) do
    render_one(chat, ChatView, "chat.json")
  end

  def render("chat.json", %{chat: chat}) do
    %{
      # id: chat.id,
      text: chat.text
    }
    # IO.inspect("chats=")
    # IO.inspect(chat.text)
  end
end
