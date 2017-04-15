# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Study.Repo.insert!(%Study.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Study.Repo

now = DateTime.utc_now

Study.Repo.delete_all(Study.Topic)
Study.Repo.delete_all(Study.Discipline)
Study.Repo.delete_all(Study.Category)
Study.Repo.delete_all(Study.User)

{2, [%{id: languages_id}, %{id: frameworks_id}]} =
  Repo.insert_all(
    Study.Category,
    [
      %{
        title: "Languages",
        priority: 4,
        inserted_at: now,
        updated_at: now
      },
      %{
        title: "Frameworks and Libraries",
        priority: 3,
        inserted_at: now,
        updated_at: now
      }
    ],
    returning: [:id]
  )

{2, [%{id: front_end_id}, %{id: back_end_id}]} =
  Repo.insert_all(
    Study.Discipline,
    [
      %{
        title: "Front End",
        priority: 4,
        inserted_at: now,
        updated_at: now
      },
      %{
        title: "Back End",
        priority: 3,
        inserted_at: now,
        updated_at: now
      }
    ],
    returning: [:id]
  )

Repo.insert_all(
  Study.Topic,
  [
    %{
      title: "Javascript",
      description: "Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean lacinia bibendum nulla sed consectetur. Nulla vitae elit libero, a pharetra augue. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.",
      rating: 90,
      category_id: languages_id,
      discipline_id: front_end_id,
      inserted_at: now,
      updated_at: now
    },
    %{
      title: "TypeScript",
      description: "Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean lacinia bibendum nulla sed consectetur. Nulla vitae elit libero, a pharetra augue. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.",
      rating: 10,
      category_id: languages_id,
      discipline_id: front_end_id,
      inserted_at: now,
      updated_at: now
    },
    %{
      title: "Elm",
      description: "Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean lacinia bibendum nulla sed consectetur. Nulla vitae elit libero, a pharetra augue. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.",
      rating: 45,
      category_id: languages_id,
      discipline_id: front_end_id,
      inserted_at: now,
      updated_at: now
    }
  ]
)

Repo.insert_all(
  Study.User,
  [
    %{
      name: "Dan",
      email: "danhenderson.web@gmail.com",
      password_hash: "$2b$12$HIeMf8yiCIwg155NHNFynurua8RzS9yHSVQNNv/y32TuQpjOlhZTS",
      inserted_at: now,
      updated_at: now
    }
  ]
)
