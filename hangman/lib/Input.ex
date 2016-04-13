defmodule Input do
  def ask_for_letter do
    s = read_stdin
    if (String.length(s) != 1) do
      IO.puts "Please type exactly one letter"
      ask_for_letter
    else
      s
    end
  end

  defp read_stdin do
    IO.read(:stdio, :line)
      |> String.rstrip(?\n)
  end
end
