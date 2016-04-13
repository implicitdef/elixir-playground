defmodule Main do

  def main(_) do
    word = WordPicker.get
    play(word, [], [])
  end

  defp play(word, hits, misses) do
    print_state(word, hits, misses)
    if (all_found(word, hits)) do
      IO.puts "Congrats, #{word} was the word"
    else
      letter = Input.ask_for_letter
      cond do
        Enum.member?(hits, letter) ->
          IO.puts "You already found #{letter}"
          play(word, hits, misses)
        Enum.member?(misses, letter) ->
          IO.puts "You already tried #{letter}"
          play(word, hits, misses)
        String.contains?(word, letter) ->
          play(word, hits ++ [letter], misses)
        true ->
          play(word, hits, misses ++ [letter])
      end
    end
  end


  defp all_found(word, hits) do
    distinct_letters_in_word = word
      |> String.split("")
      |> Enum.drop(-1)
      |> Enum.uniq
      |> Enum.count
    distinct_letters_in_word == Enum.count(hits)
  end

  defp print_state(word, hits, misses) do
    out = word
      |> String.split("")
      |> Enum.drop(-1)
      |> Enum.map(fn(l) ->
        if (Enum.member?(hits, l)) do
          l
        else
          "."
        end
      end)
      |> List.to_string
    tries = Enum.count(hits) + Enum.count(misses)
    IO.puts "#{out} (#{tries} tries)"
  end

end
