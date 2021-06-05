defmodule ExmealWeb.UsersViewTest do
  use ExmealWeb.ConnCase, async: true

  import Phoenix.View

  import Exmeal.Factory

  alias Exmeal.User

  alias ExmealWeb.UsersView

  test "render create.json" do
    user = insert(:user)
    response = render(UsersView, "create.json", user: user)

    assert %{
             user: %User{
               cpf: "12345678901",
               email: "rx@gmail.com",
               name: "Roderix",
               id: _id
             },
             message: "User created successfully"
           } = response
  end

  test "render user.json" do
    user = insert(:user)

    response = render(UsersView, "user.json", user: user)

    assert %{
             user: %User{
               cpf: "12345678901",
               email: "rx@gmail.com",
               name: "Roderix",
               id: _id
             }
           } = response
  end
end
