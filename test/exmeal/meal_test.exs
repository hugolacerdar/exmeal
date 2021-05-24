defmodule Exmeal.MealTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Ecto.Changeset

  alias Exmeal.Meal

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:meal_params)

      response = Meal.changeset(params)

      assert %Changeset{
               changes: %{description: "Banana", date: ~N[2001-05-02 12:00:00], calories: cals},
               valid?: true
             } = response

      assert Decimal.to_float(cals) == 20.44
    end

    test "when any of the params are invalid, return errors" do
      params =
        build(:meal_params, %{
          "description" =>
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sodales sed diam sit amet vulputate. Nullam blandit maximus congue. Morbi vitae odio vitae lorem commodo viverra. Sed scelerisque, diam non mattis posuere, nisl est dictum lorem, in efficitur felis neque sed augue. Nam mollis lacus ut nisi pellentesque, id maximus nisi dignissim. Sed dignissim risus a finibus tincidunt. Maecenas augue lorem, porttitor vitae risus vel, vulputate malesuada lectus. Sed semper, erat vel fringilla laoreet, nulla sem blandit justo, pulvinar tristique risus mauris a lectus. Proin ut volutpat velit. Nam vehicula ante sed egestas semper. Aenean eu sapien et tellus molestie."
        })

      expected = %{description: ["should be at most 255 character(s)"]}

      response = Meal.changeset(params)

      assert errors_on(response) == expected
    end
  end

  describe "changeset/2" do
    test "when all params are valid, returns a valid updated changeset" do
      params = build(:meal_params)

      changeset = Meal.changeset(params)

      changes = %{"description" => "Banana Frita"}

      response = Meal.changeset(changeset, changes)

      assert %Changeset{
               changes: %{
                 description: "Banana Frita",
                 date: ~N[2001-05-02 12:00:00],
                 calories: _cals
               },
               valid?: true
             } = response
    end
  end
end
