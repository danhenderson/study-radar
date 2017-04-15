defmodule Study.DisciplineTest do
  use Study.ModelCase

  alias Study.Discipline

  @valid_attrs %{description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Discipline.changeset(%Discipline{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Discipline.changeset(%Discipline{}, @invalid_attrs)
    refute changeset.valid?
  end
end
