defmodule Exmeal.Users.Delete do
  alias Exmeal.{Error, Repo, User}

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.user_not_found()}
      user -> Repo.delete(user)
    end
  end
end
