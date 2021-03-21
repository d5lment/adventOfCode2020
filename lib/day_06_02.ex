defmodule Day0602 do
  @pattern_row ~r/^[a-z]+$/

  @moduledoc """
      iex> Day0602.count_yes_questions("/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/advent_of_code_2020/lib/resources/day_06/input_06.txt")
      6387
  """
  def count_yes_questions(file_path) do
    file_path
    |> get_entries()
    |> Enum.map(
      fn x ->
        x
        |> List.flatten()
        |> Enum.uniq()
        |> Enum.count()
      end)
      |> Enum.sum()
  end

  def get_entries(file_path) do
    {:ok, contents} = File.read(file_path) #"abc\n\n  a\nb\nc\n\n  ab\nac\n\n  a\na\na\na\n\n  b"

    contents
    |> String.replace("\n\n", "*")   #"abc\n\n  a\nb\nc\n\n  ab\nac\n\n  a\na\na\na\n\n  b"
    |> String.replace("\n", "-")     #"abc*  a\nb\nc*  ab\nac*  a\na\na\na*  b"
    |> String.split("*", trim: true) #["abc", "a-b-c", "ab-ac", "a-a-a-a", "b"]
    |> Enum.reduce([], fn x, acc ->
      case Regex.match?(@pattern_row, x) do
        true -> #reenglones de puras letras
          [String.graphemes(x)|acc]
        _ -> #reenglones con columnas (es decir guiones)
          rows = String.split(x, "-", trim: true)
          column =
            Enum.map(rows, fn y ->
              String.graphemes(y)
            end)
          [column | acc]
      end
    end)
  end

end
