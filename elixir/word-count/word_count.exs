defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  def tally(contents, word) do
    contents
      |> Enum.filter(&(&1 == word))
      |> Enum.count()
  end

  @spec count(String.t()) :: map
  def count(sentence) do
    sentence = Regex.replace(~r/_/, sentence, " ")

    contents = Regex.scan(~r/(\w|\d|-)+/u, sentence, capture: :first)
      |> List.flatten()
      |> Enum.map(&(String.downcase(&1)))

    Enum.uniq(contents)
      |> Map.new( &{&1, tally(contents, &1)} )
  end
end
