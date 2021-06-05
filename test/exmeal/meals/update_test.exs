defmodule Exmeal.Meals.UpdateTest do
  use Exmeal.DataCase
  import Exmeal.Factory

  describe "Update Meal" do
    setup do
      user = insert(:user)
      {:ok, user: user}
    end

    test "when a valid id is given, returns the meal" do
      id = "7bbd8c4a-104c-4b7e-a3e8-0e447e5f2412"

      insert(:meal)

      response = Exmeal.update_meal(%{"id" => id, "calories" => 253.4})

      assert {:ok,
              %Exmeal.Meal{
                calories: cals,
                date: ~N[2001-05-02 12:00:00],
                description: "Banana",
                id: _id
              }} = response

      assert cals == Decimal.from_float(253.4)
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Exmeal.update_meal(%{"id" => id})

      assert {:error, %Exmeal.Error{result: "Meal not found", status: :not_found}} = response
    end
  end
end
