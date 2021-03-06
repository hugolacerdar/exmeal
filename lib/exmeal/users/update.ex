defmodule Exmeal.Users.Update do
  alias Exmeal.{Error, Repo, User}

  def call(%{"id" => id} = params) do
    case Repo.get(User, id) |> Repo.preload(:meals) do
      nil -> {:error, Error.user_not_found()}
      user -> do_update(user, params)
    end
  end

  defp do_update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %User{}} = result), do: result
  defp handle_update({:error, result}), do: {:error, Error.build(:bad_request, result)}
end
