defmodule Exmeal.UserTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Ecto.Changeset

  alias Exmeal.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{
               changes: %{
                 cpf: "23156437543",
                 email: "rx@bananamail.com",
                 name: "Roderix"
               },
               valid?: true
             } = response
    end
  end
end
