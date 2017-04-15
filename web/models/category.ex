defmodule Study.Category do
  use Study.Web, :model

  schema "categories" do
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
    |> cast(params, [:title, :description])
    |> validate_required([:title])
  end
end
