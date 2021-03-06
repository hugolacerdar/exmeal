defmodule Exmeal.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def meal_not_found, do: build(:not_found, "Meal not found")
  def user_not_found, do: build(:not_found, "User not found")
end
