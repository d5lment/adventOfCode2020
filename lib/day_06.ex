defmodule Day06 do
  @moduledoc """
  Documentation for `Day 06`.
  """
  def get_entries() do
    file_path = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/advent_of_code_2020/lib/resources/day_04/input_06_sample.txt"
    {:ok, contents} = File.read(file_path)

    contents
    |> String.split("\n\n", trim: true)
    |> Enum.map(fn x -> String.replace(x, " ", "\n")  end)
    |> Enum.map(fn x -> String.split(x, "\n", trim: true)  end)
    |> Enum.map(fn x ->
        Enum.map(x, fn fields ->
          String.split(fields, ":", trim: true)
        end)
      end)
    |> Enum.map(fn pairs ->
        Enum.reduce(pairs, [], fn ([key, val], acc) ->
        [{String.to_atom(key), val} | acc]
      end)
    end)
  end
end
