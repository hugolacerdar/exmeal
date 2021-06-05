defmodule Exmeal.Users.CreateTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Exmeal.{Error, User}
  alias Exmeal.Users.Create

  describe "Create User" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      {:ok, response} = Create.call(params)

      assert %User{
               cpf: "23156437543",
               email: "rx@bananamail.com",
               id: _id,
               name: "Roderix"
             } = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        cpf: 12_345_678_900,
        email: "husn.acn"
      }

      response = Create.call(params)

      assert {:error, %Error{}} = response
    end
  end
end
