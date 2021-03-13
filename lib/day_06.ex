defmodule Day06 do
  @moduledoc """
  Documentation for `Day 06`.
  """
  def get_entries() do
    file_path = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/advent_of_code_2020/lib/resources/day_06/input_06_sample.txt"
    {:ok, contents} = File.read(file_path)

    contents
    |> Enum.map(fn x ->  String.split(x, "\n", trim: true) end)
    # |> Enum.map(fn x -> String.graphemes(x)  end)
    # |> Enum.map(fn x -> String.split(x, "\n", trim: true)  end)
    # |> String.split("\n\n", trim: true)
  end
end
