defmodule Study.PageController do
  use Study.Web, :controller

  import Ecto.Query
  alias Study.{Category, Discipline, Topic}

  plug :put_layout, "web.html"

  def index(conn, _params) do
    disciplines = Repo.all(Discipline)
    render conn, "index.html", disciplines: disciplines
  end

  def topics(conn, %{"discipline" => discipline}) do
    categories = get_categories(discipline)

    discipline =
      Repo.get!(Discipline, discipline)
      |> Repo.preload(:topics)

    render conn, "topics.html", discipline: discipline, categories: categories
  end

  def topic(conn, %{"discipline" => discipline, "topic" => topic}) do
    categories = get_categories(discipline)

    topic =
      Repo.get_by(Topic, id: topic, discipline_id: discipline)
      |> Repo.preload(:discipline)
      |> Repo.preload(:category)

    render conn, "topic.html", topic: topic, categories: categories
  end

  defp get_categories(discipline) do
    Repo.all(
      from c in Category,
      join: t in assoc(c, :topics),
      where: t.discipline_id == ^discipline,
      preload: [topics: t],
      order_by: [desc: c.priority, desc: t.rating] 
    )
  end
end
