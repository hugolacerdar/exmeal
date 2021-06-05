defmodule Exmeal.Users.Get do
  alias Exmeal.{Error, Repo, User}

  def by_id(id) do
    case Repo.get(User, id) |> Repo.preload(:meals) do
      nil -> {:error, Error.user_not_found()}
      user -> {:ok, user}
    end
  end
end
