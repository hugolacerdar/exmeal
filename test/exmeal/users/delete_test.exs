defmodule Exmeal.Users.DeleteTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Exmeal.User
  alias Exmeal.Users.Delete

  describe "Delete user" do
    test "when a valid id is given, returns the user" do
      id = "82776a19-02ef-4166-8370-f285a0734c26"
      insert(:user)

      response = Delete.call(id)

      assert {:ok,
              %User{
                cpf: "12345678901",
                email: "rx@gmail.com",
                id: ^id,
                name: "Roderix"
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Delete.call(id)

      assert {:error, %Exmeal.Error{result: "User not found", status: :not_found}} = response
    end
  end
end
