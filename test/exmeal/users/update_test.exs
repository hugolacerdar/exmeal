defmodule Exmeal.User.UpdateTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Exmeal.User
  alias Exmeal.Users.Update

  describe "Update Meal" do
    test "when a valid id is given, returns the meal" do
      id = "82776a19-02ef-4166-8370-f285a0734c26"
      insert(:user)

      response = Update.call(%{"id" => id, "name" => "Banana"})

      assert {:ok,
              %User{
                cpf: "12345678901",
                email: "rx@gmail.com",
                id: ^id,
                name: "Banana"
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Update.call(%{"id" => id})

      assert {:error, %Exmeal.Error{result: "User not found", status: :not_found}} = response
    end
  end
end
