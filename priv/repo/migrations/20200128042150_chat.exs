defmodule Neko.Repo.Migrations.Chat do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :text, :string

      timestamps()
    end
  end
end
