# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MyApp.Repo.insert!(%MyApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias MyApp.Accounts.User
alias MyApp.Repo

Repo.insert!(%User{username: "dblack", display_name: "Darren", email: "dblack@email.com"})
Repo.insert!(%User{username: "jblow", display_name: "John", email: "jblow@email.com"})
Repo.insert!(%User{username: "aother", display_name: "Anne", email: "aother@email.com"})
