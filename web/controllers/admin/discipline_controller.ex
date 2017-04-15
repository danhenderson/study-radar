defmodule Study.Admin.DisciplineController do
  use Study.Web, :controller

  alias Study.Discipline

  def index(conn, _params) do
    disciplines = Repo.all(Discipline)
    render(conn, "index.html", disciplines: disciplines)
  end

  def new(conn, _params) do
    changeset = Discipline.changeset(%Discipline{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"discipline" => discipline_params}) do
    changeset = Discipline.changeset(%Discipline{}, discipline_params)

    case Repo.insert(changeset) do
      {:ok, _discipline} ->
        conn
        |> put_flash(:info, "Discipline created successfully.")
        |> redirect(to: discipline_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    discipline = Repo.get!(Discipline, id)
    render(conn, "show.html", discipline: discipline)
  end

  def edit(conn, %{"id" => id}) do
    discipline = Repo.get!(Discipline, id)
    changeset = Discipline.changeset(discipline)
    render(conn, "edit.html", discipline: discipline, changeset: changeset)
  end

  def update(conn, %{"id" => id, "discipline" => discipline_params}) do
    discipline = Repo.get!(Discipline, id)
    changeset = Discipline.changeset(discipline, discipline_params)

    case Repo.update(changeset) do
      {:ok, discipline} ->
        conn
        |> put_flash(:info, "Discipline updated successfully.")
        |> redirect(to: discipline_path(conn, :show, discipline))
      {:error, changeset} ->
        render(conn, "edit.html", discipline: discipline, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    discipline = Repo.get!(Discipline, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(discipline)

    conn
    |> put_flash(:info, "Discipline deleted successfully.")
    |> redirect(to: discipline_path(conn, :index))
  end
end
