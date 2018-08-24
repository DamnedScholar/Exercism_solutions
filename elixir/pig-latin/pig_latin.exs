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

    # 1 - least frequent: 'x' or 'y' followed by a consonant
    # 2: word starting with 'qu'
    # 3: word starting with a vowel (aeiou)
    # 4: all other words must start with a standard consonant
    #   4.a: if 'qu' is encountered following consonants, it is treated as a
    #        consonant and moved to the back of the word, but the search ends
  end

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase =
      phrase
        |> String.split(~r{\W}, trim: true)
        |> Enum.map(&(anslatetray(&1)))
        |> List.to_string()
  end
end
