defmodule Exmeal.UsersControllerTest do
  use ExmealWeb.ConnCase, async: true

  import Exmeal.Factory

  describe "create/2" do
    test "when all params are valid, creates a user", %{conn: conn} do
      params = build(:user_params)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created successfully",
               "user" => %{
                 "cpf" => "23156437543",
                 "email" => "rx@bananamail.com",
                 "id" => _id,
                 "meals" => [],
                 "name" => "Roderix"
               }
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{description: "Banana"}

      expected_response = %{
        "message" => %{
          "cpf" => ["can't be blank"],
          "name" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when id exists, deletes the user", %{conn: conn} do
      id = "82776a19-02ef-4166-8370-f285a0734c26"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert "" = response
    end

    test "when id doesn't exist, returns an error", %{conn: conn} do
      id = "5e694bc0-78fc-4600-bcd0-0733b7540a6e"

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> json_response(:not_found)

      assert %{
               "message" => "User not found"
             } = response
    end
  end

  describe "update/2" do
    test "when id exists, updates the user", %{conn: conn} do
      id = "82776a19-02ef-4166-8370-f285a0734c26"
      insert(:user)

      updated_params = %{
        name: "Nufi"
      }

      response =
        conn
        |> put(Routes.users_path(conn, :update, id, updated_params))
        |> json_response(:ok)

      assert %{
               "user" => %{
                 "cpf" => "12345678901",
                 "email" => "rx@gmail.com",
                 "id" => "82776a19-02ef-4166-8370-f285a0734c26",
                 "name" => "Nufi"
               }
             } = response
    end

    test "when id doesn't exists, returns an error", %{conn: conn} do
      id = "5e694bc0-78fc-4600-bcd0-0733b7540a6e"

      response =
        conn
        |> put(Routes.users_path(conn, :update, id))
        |> json_response(:not_found)

      assert %{"message" => "User not found"} = response
    end
  end

  describe "get/2" do
    test "when id exists, returns the user", %{conn: conn} do
      id = "82776a19-02ef-4166-8370-f285a0734c26"
      insert(:user)

      response =
        conn
        |> get(Routes.users_path(conn, :show, id))
        |> json_response(:ok)

      assert %{
               "user" => %{
                 "cpf" => "12345678901",
                 "email" => "rx@gmail.com",
                 "id" => "82776a19-02ef-4166-8370-f285a0734c26",
                 "name" => "Roderix",
                 "meals" => []
               }
             } = response
    end

    test "when id doesn't exist, returns an error", %{conn: conn} do
      id = "5e694bc0-78fc-4600-bcd0-0733b7540a6e"

      response =
        conn
        |> get(Routes.users_path(conn, :update, id))
        |> json_response(:not_found)

      assert %{"message" => "User not found"} = response
    end
  end
end
