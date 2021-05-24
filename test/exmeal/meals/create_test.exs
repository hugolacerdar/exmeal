defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase, async: true
  import Exmeal.Factory
  alias Exmeal.Error

  describe "Create Meal" do
    test "when all params are valid, returns the meal" do
      params = build(:meal_params)

      response = Exmeal.create_meal(params)

      assert {:ok,
              %Exmeal.Meal{
                calories: cals,
                date: ~N[2001-05-02 12:00:00],
                description: "Banana",
                id: _id
              }} = response

      assert Decimal.to_string(cals) == params["calories"]
    end

    test "when there are invalid params, returns an error" do
      params = build(:meal_params, %{"description" => nil})

      response = Exmeal.create_meal(params)

      assert {:error,
              %Error{
                result: %Ecto.Changeset{
                  valid?: false,
                  action: :insert,
                  errors: [description: {"can't be blank", [validation: :required]}]
                },
                status: :bad_request
              }} = response
    end
  end
end
