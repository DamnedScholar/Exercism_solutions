defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  
  def capital?(char) do
    # I need a function to identify capitals.
    # https://stackoverflow.com/a/36967499/5818274
    
    char =~ ~r/^\p{Lu}$/u
  end
  
  def number?(string) do
    String.match?(string, ~r/^\d+$/)
  end
  
  def reduce(word) do
    if number?(word) do  # If the word is a number, return it whole.
      word
    else
      chars = String.splitter(word, "", trim: true) |> Enum.to_list()
      initial = [ List.first(chars) ]  # This needs to be an enumerable.
      capitals =
        chars
          |> Enum.drop(1)
          |> Enum.filter(fn l -> capital?(l) end)
      
      Enum.concat(initial, capitals) |> List.to_string()
    end
  end
  
  def abbreviate(string) do
    # The algorithm should run through the string and accumulate a collection of
    # characters that begin a word or are capitalized, unless the whole string is
    # capitalized.
    
    # I need to recursively iterate the characters in the string. It would
    # probably be best to split the string by word instead of by character,
    # then split individual words by character.
    
    sentence = String.split(string, ~r{\W}, trim: true)
    
    acronym =
      sentence
        |> Enum.map(fn w -> reduce(w) end)
        |> List.to_string()
        |> String.upcase()
        
    # Adding numbers isn't in the spec, but I can do it anyway.
    acronym = Regex.replace(~r/(\w)(\d+)/, acronym, "\\1-\\2")
    acronym = Regex.replace(~r/(\d+)(\w)/, acronym, "\\1-\\2")
    
    acronym
  end
end
