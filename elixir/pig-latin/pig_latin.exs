defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  def anslatetray(word) do
    # We can run a cond statement in order of exclusivity to eliminate the most
    # specific cases. That way we don't have to identify consonants themselves,
    # just the vowels.
    cond do
      Regex.match?(~r/^(x|y)[^aeiou]/, word) ->
        word <> "ay "
      Regex.match?(~r/^([aeiou]+)/, word) ->
        word <> "ay "
      parts = Regex.named_captures(~r/^(?<prefix>[^aeiou]*(qu))(?<body>.*)/, word) ->
        parts["body"] <> parts["prefix"] <> "ay "
      parts = Regex.named_captures(~r/^(?<prefix>[^aeiou]*)(?<body>.*)/, word) ->
        parts["body"] <> parts["prefix"] <> "ay "
    end
  end

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
      |> String.split(~r/\W/, trim: true)
      |> Enum.map(&(anslatetray(&1)))
      |> List.to_string()
      |> String.trim()
  end
end
