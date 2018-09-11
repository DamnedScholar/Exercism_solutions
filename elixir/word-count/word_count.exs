defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
      |> String.replace(~r/_/u, " ")
      |> String.split(~r/[^\w\d-]+/u, trim: true)
      |> List.flatten()
      |> Enum.map(&(String.downcase(&1)))
      |> Enum.reduce(
        Map.new(), fn(word, counts) -> Map.update(counts, word, 1, &(&1 + 1)) end
      )
  end
end
