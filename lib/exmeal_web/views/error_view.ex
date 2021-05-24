defmodule ExmealWeb.ErrorView do
  use ExmealWeb, :view

  import Ecto.Changeset, only: [traverse_errors: 2]

  alias Ecto.Changeset

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  def render("error.json", %{result: %Changeset{} = result}) do
    %{message: translate_errors(result)}
  end

  def render("error.json", %{result: result}) do
    %{message: result}
  end

  def translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, result}, acc ->
        String.replace(acc, "%{#{key}}", to_string(result))
      end)
    end)
  end
end
