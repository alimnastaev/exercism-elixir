defmodule Bob do
  def hey(input) do
    input
    |> answer()
  end

  defp answer(input) do
    cond do
      silence?(input) ->
        "Fine. Be that way!"

      upcase?(input) and question?(input) ->
        "Calm down, I know what I'm doing!"

      upcase?(input) ->
        "Whoa, chill out!"

      question?(input) ->
        "Sure."

      true ->
        "Whatever."
    end
  end

  defp silence?(input) do
    String.trim(input) == ""
  end

  defp upcase?(input) do
    String.upcase(input) == input and String.downcase(input) != input
  end

  defp question?(input) do
    input
    |> String.trim()
    |> String.ends_with?("?")
  end
end
