defmodule Day01 do
  @moduledoc """
  Documentation for `Day 01`.
  """

  @doc """
    704 + 1316 = 2020
    704 * 1316 = 926464
  ## Examples

      iex> Day1.hello()
      :world

  """
  def part_one(entries) do
    get_entries()
    |> Enum.map(fn x ->
      Enum.filter(entries, fn y ->
        y + x == 2020
      end)
    end)
    |> List.flatten()
  end

  def part_two() do

  end

  # def part_two do
  #   # test_file = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/day1/puzzle_input_d1_sample.txt"
  #   test_file = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/day1/puzzle_input_d1.txt"
  #   {:ok, contents} = File.read(test_file)

  #   # [{1721, 0}, {979, 1}, {366, 2}, {299, 3}, {675, 4}, {1456, 5}]
  #   entries =
  #     contents
  #     |> String.split("\n", trim: true)
  #     |> Enum.map(fn x -> String.to_integer(x) end)
  #     |> Enum.with_index()

  #   size_entries = Enum.count(entries)

  #   # res =
  #     Enum.map(entries, fn {x, idx} ->
  #       Enum.filter(entries, fn {y, _idy} ->
  #         x2 =
  #           case Enum.at(entries, idx + 1) do
  #             {x2, _idx2} ->
  #               x2

  #             nil ->
  #               {v, 0} = Enum.at(entries, size_entries - (idx + 1))
  #               v
  #           end

  #         if(y != x && y != x2) do
  #           sum = x + x2 + y
  #           # IO.inspect("Indice de X: #{idx}, Indice de Y: #{idy}")
  #           IO.inspect("#{x} + #{x2} + #{y} = #{sum}")
  #           x + x2 + y == 2020
  #         end
  #       end)
  #     end)

  #   # Enum.each(res, fn x -> IO.inspect(x) end)
  # end

  defp get_entries() do
    test_file =
      "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/day1/puzzle_input_d1_sample.txt"

    # file = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/day1/puzzle_input_d1.txt"
    {:ok, contents} = File.read(test_file)

    contents
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> String.to_integer(x) end)
  end
end
