defmodule WordPicker do

  @min_length 10

  def get do
    File.read!("words.txt")
      |> String.split("\n")
      |> Enum.filter(&(String.length(&1) > @min_length))
      |> Enum.random
  end
end
