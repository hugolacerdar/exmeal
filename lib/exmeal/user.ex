defmodule Exmeal.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Exmeal.Meal

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:cpf, :email, :name]

  @derive {Jason.Encoder, only: @required_params ++ [:id, :meals]}

  schema "users" do
    field(:name, :string)
    field(:cpf, :string)
    field(:email, :string)

    has_many(:meals, Meal)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:name, min: 2)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @required_params)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:name, min: 2)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
  end
end
