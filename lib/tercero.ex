defmodule Tercero do
  @moduledoc """

  """

  @doc """
  Hello world.

  ## Examples

      iex> Day1.hello()
      :world

  """
  def part_two do
    test_file = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/day1/puzzle_input_d1_sample.txt"
    {:ok, contents} = File.read(test_file)

    #[{1721, 0}, {979, 1}, {366, 2}, {299, 3}, {675, 4}, {1456, 5}]
    entries =
      contents
      |> String.split("\n", trim: true)
      |> Enum.map(fn x -> String.to_integer(x) end)

    data =
      entries
      |> Enum.with_index()

    size_entries = Enum.count(entries)

    Enum.reduce(data, fn {x, idx}, acc ->
      x2 = get_x2(data, idx, size_entries)

      values =
        Enum.filter(entries, fn y ->
          if(y != x && y != x2 ) do
            x + x2 + y == 2020
          end
        end)

      # Enum.each(values, fn x -> IO.inspect("Valores: #{x}") end)

      Enum.map(values, fn value ->
        [{x, x2, value}] ++ acc
      end)
    end)
  end

  def get_x2(data, idx, size_entries) do
    case Enum.at(data, idx+1) do
      {x2, _idx2} ->
        x2
      nil ->
        {v, 0} = Enum.at(data, size_entries - (idx+1))
        v
    end
  end

end
