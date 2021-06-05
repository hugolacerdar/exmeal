defmodule Exmeal.Factory do
  use ExMachina.Ecto, repo: Exmeal.Repo

  alias Exmeal.{Meal, User}

  def meal_params_factory do
    %{
      "calories" => "20.44",
      "date" => "2001-05-02 12:00:00",
      "description" => "Banana",
      "user_id" => "82776a19-02ef-4166-8370-f285a0734c26"
    }
  end

  def meal_factory do
    %Meal{
      calories: 20.44,
      date: ~N[2001-05-02 12:00:00],
      description: "Banana",
      id: "7bbd8c4a-104c-4b7e-a3e8-0e447e5f2412",
      user_id: "82776a19-02ef-4166-8370-f285a0734c26"
    }
  end

  def user_params_factory do
    %{
      name: "Roderix",
      email: "rx@bananamail.com",
      cpf: "23156437543"
    }
  end

  def user_factory do
    %User{
      cpf: "12345678901",
      email: "rx@gmail.com",
      id: "82776a19-02ef-4166-8370-f285a0734c26",
      name: "Roderix"
    }
  end
end
