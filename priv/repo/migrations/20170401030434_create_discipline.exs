defmodule Study.Repo.Migrations.CreateDiscipline do
  use Ecto.Migration

  def change do
    create table(:disciplines) do
      add :title, :string
      add :description, :text
      add :priority, :integer

      timestamps()
    end

  end
end
