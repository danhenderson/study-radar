defmodule Study.Discipline do
  use Study.Web, :model

  schema "disciplines" do
    field :title, :string
    field :description, :string
    field :priority, :integer
    has_many :topics, Study.Topic

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :priority])
    |> validate_required([:title])
  end
end
