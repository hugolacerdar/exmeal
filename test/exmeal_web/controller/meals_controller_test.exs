defmodule Exmeal.MealsControllerTest do
  use ExmealWeb.ConnCase, async: true

  import Exmeal.Factory

  describe "create/2" do
    test "when all params are valid, creates a meal", %{conn: conn} do
      params = build(:meal_params)

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "meal" => %{
                 "calories" => "20.44",
                 "date" => "2001-05-02T12:00:00",
                 "description" => "Banana"
               },
               "message" => "Meal created successfully!"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{description: "Banana"}

      expected_response = %{
        "message" => %{"calories" => ["can't be blank"], "date" => ["can't be blank"]}
      }

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when id exist, delete the meal", %{conn: conn} do
      id = "7bbd8c4a-104c-4b7e-a3e8-0e447e5f2412"

      insert(:meal)

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> response(:no_content)

      assert "" = response
    end

    test "when id not exist, return an error", %{conn: conn} do
      id = "5e694bc0-78fc-4600-bcd0-0733b7540a6e"

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> json_response(:not_found)

      assert %{
               "message" => "Meal not found"
             } = response
    end
  end

  describe "update/2" do
    test "when id exist, update the meal", %{conn: conn} do
      id = "7bbd8c4a-104c-4b7e-a3e8-0e447e5f2412"

      insert(:meal)

      params = %{"description" => "Banana Assada"}

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id, params))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "calories" => "20.44",
                 "date" => "2001-05-02T12:00:00",
                 "description" => "Banana Assada"
               }
             } = response
    end

    test "when not exist id, return an error", %{conn: conn} do
      id = "5e694bc0-78fc-4600-bcd0-0733b7540a6e"

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id))
        |> json_response(:not_found)

      assert %{"message" => "Meal not found"} = response
    end
  end

  describe "show/2" do
    test "when id exist, return the meal", %{conn: conn} do
      id = "7bbd8c4a-104c-4b7e-a3e8-0e447e5f2412"

      insert(:meal)

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "calories" => "20.44",
                 "date" => "2001-05-02T12:00:00",
                 "description" => "Banana"
               }
             } = response
    end

    test "when id not exist, return an error", %{conn: conn} do
      id = "5e694bc0-78fc-4600-bcd0-0733b7540a6e"

      response =
        conn
        |> get(Routes.meals_path(conn, :update, id))
        |> json_response(:not_found)

      assert %{"message" => "Meal not found"} = response
    end
  end
end
