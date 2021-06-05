defmodule Exmeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset
  alias Exmeal.User
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [:description, :date, :calories, :user_id]

  @derive {Jason.Encoder, only: @required_params}

  schema "meals" do
    field(:description, :string)
    field(:date, :naive_datetime)
    field(:calories, :decimal)

    belongs_to(:user, User)
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
