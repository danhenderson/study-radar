defmodule Study.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :title, :string
      add :description, :text
      add :priority, :integer

      timestamps()
    end

  end
end
