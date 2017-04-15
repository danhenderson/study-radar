defmodule Study.Repo.Migrations.CreateTopic do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :title, :string
      add :description, :text
      add :rating, :integer
      add :category_id, references(:categories, on_delete: :nothing)
      add :discipline_id, references(:disciplines, on_delete: :nothing)

      timestamps()
    end
    create index(:topics, [:category_id])
    create index(:topics, [:discipline_id])

  end
end
