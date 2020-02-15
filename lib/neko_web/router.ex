defmodule NekoWeb.Router do
  use NekoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug, origin: "*"
    # plug Neko.Router
  end

  scope "/", NekoWeb do
    pipe_through :api
    post "/recv", ChatController, :recv
    options "/recv", ChatController, :options

    post "/show",  ChatController, :show
    get "/chatlog", ChatController, :chatlog
    options "/chatlog", ChatController, :options # 追加
    # options "/items/:id", ItemController, :options

    # get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", NekoWeb do
  #   pipe_through :api
  # end
end
