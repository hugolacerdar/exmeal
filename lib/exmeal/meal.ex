defmodule Exmeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:description, :date, :calories]

  @derive {Jason.Encoder, only: @required_params}

  schema "meals" do
    field(:description, :string)
    field(:date, :naive_datetime)
    field(:calories, :decimal)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, max: 255)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @required_params)
    |> validate_length(:description, max: 255)
  end
end
