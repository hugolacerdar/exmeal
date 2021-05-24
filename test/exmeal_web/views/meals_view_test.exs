defmodule ExmealWeb.MealsViewTest do
  use ExmealWeb.ConnCase, async: true

  import Exmeal.Factory
  import Phoenix.View
  alias Exmeal.Meal
  alias ExmealWeb.MealsView

  test "render create.json" do
    params = build(:meal_params)
    {_ok, meal} = Exmeal.create_meal(params)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: _cals,
               date: ~N[2001-05-02 12:00:00],
               description: "Banana"
             },
             message: "Meal created successfully!"
           } = response
  end

  test "render meal.json" do
    params = build(:meal_params)
    {_ok, meal} = Exmeal.create_meal(params)

    response = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: _cals,
               date: ~N[2001-05-02 12:00:00],
               description: "Banana"
             }
           } = response
  end
end
