defmodule Exmeal.Factory do
  use ExMachina.Ecto, repo: Exmeal.Repo

  alias Exmeal.Meal

  def meal_params_factory do
    %{
      "calories" => "20.44",
      "date" => "2001-05-02 12:00:00",
      "description" => "Banana"
    }
  end

  def meal_factory do
    %Meal{
      calories: 20.44,
      date: ~N[2001-05-02 12:00:00],
      description: "Banana",
      id: "7bbd8c4a-104c-4b7e-a3e8-0e447e5f2412"
    }
  end
end
