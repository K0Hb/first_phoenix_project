# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FirstPhoenixProject.Repo.insert!(%FirstPhoenixProject.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias FirstPhoenixProject.{Repo, Word}

Repo.insert! %Word{eng: "dog", rus: "собака"}
Repo.insert! %Word{eng: "cat", rus: "кот"}
