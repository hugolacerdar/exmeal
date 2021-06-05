defmodule Exmeal.Users.Create do
  alias Exmeal.{Error, Repo, User}

  def call(params) do
    with changeset <- User.changeset(params),
         {:ok, %User{} = user} <- Repo.insert(changeset) do
      user = Repo.preload(user, :meals)
      {:ok, user}
    else
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end
end
