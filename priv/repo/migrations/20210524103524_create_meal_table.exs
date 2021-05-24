defmodule Exmeal.Repo.Migrations.CreateMealTable do
  use Ecto.Migration

  def change do
    create table(:meals) do
      add(:description, :string)
      add(:date, :naive_datetime)
      add(:calories, :decimal)

      timestamps()
    end
  end
end
