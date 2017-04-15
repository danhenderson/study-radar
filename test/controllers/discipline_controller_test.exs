defmodule Study.DisciplineControllerTest do
  use Study.ConnCase

  alias Study.Discipline
  @valid_attrs %{description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, discipline_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing disciplines"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, discipline_path(conn, :new)
    assert html_response(conn, 200) =~ "New discipline"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, discipline_path(conn, :create), discipline: @valid_attrs
    assert redirected_to(conn) == discipline_path(conn, :index)
    assert Repo.get_by(Discipline, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, discipline_path(conn, :create), discipline: @invalid_attrs
    assert html_response(conn, 200) =~ "New discipline"
  end

  test "shows chosen resource", %{conn: conn} do
    discipline = Repo.insert! %Discipline{}
    conn = get conn, discipline_path(conn, :show, discipline)
    assert html_response(conn, 200) =~ "Show discipline"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, discipline_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    discipline = Repo.insert! %Discipline{}
    conn = get conn, discipline_path(conn, :edit, discipline)
    assert html_response(conn, 200) =~ "Edit discipline"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    discipline = Repo.insert! %Discipline{}
    conn = put conn, discipline_path(conn, :update, discipline), discipline: @valid_attrs
    assert redirected_to(conn) == discipline_path(conn, :show, discipline)
    assert Repo.get_by(Discipline, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    discipline = Repo.insert! %Discipline{}
    conn = put conn, discipline_path(conn, :update, discipline), discipline: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit discipline"
  end

  test "deletes chosen resource", %{conn: conn} do
    discipline = Repo.insert! %Discipline{}
    conn = delete conn, discipline_path(conn, :delete, discipline)
    assert redirected_to(conn) == discipline_path(conn, :index)
    refute Repo.get(Discipline, discipline.id)
  end
end
