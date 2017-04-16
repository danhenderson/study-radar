defmodule Study.Topic do
  use Study.Web, :model

  schema "topics" do
    field :title, :string
    field :description, :string
    field :rating, :integer
    belongs_to :category, Study.Category
    belongs_to :discipline, Study.Discipline

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :rating, :category_id, :discipline_id])
    |> validate_required([:title, :rating, :category_id, :discipline_id])
  end
end
