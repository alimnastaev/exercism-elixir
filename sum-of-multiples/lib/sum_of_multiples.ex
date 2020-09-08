defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  def to(limit, factors), do: sum(limit, factors)
  defp sum(limit, factors) do
    for number <- 0..(limit - 1), parse(number, factors), reduce: 0 do
      acc -> number + acc
    end
  end

  defp parse(number, factors),
    do: Enum.any?(factors, fn factor -> rem(number, factor) == 0 end)
end
