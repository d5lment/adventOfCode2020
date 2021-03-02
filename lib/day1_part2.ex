defmodule Day1Part2 do
  @moduledoc """
  The Elves in accounting are thankful for your help;
  one of them even offers you a starfish coin they had left over from a past vacation.

  They offer you a second one if you can find three numbers in your expense report that meet the same criteria.

  Using the above example again, the three entries that sum to 2020 are 979, 366, and 675.
  Multiplying them together produces the answer, 241861950.
  In your expense report, what is the product of the three entries that sum to 2020?
  """

  @doc """
  Hello world.

  ## Examples

      iex> Day1.hello()
      :world

  """
  def part_two do
    test_file = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/day1/puzzle_input_d1_sample.txt"
    # test_file = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/day1/puzzle_input_d1.txt"
    {:ok, contents} = File.read(test_file)

    #[{1721, 0}, {979, 1}, {366, 2}, {299, 3}, {675, 4}, {1456, 5}]
    entries =
      contents
      |> String.split("\n", trim: true)
      |> Enum.map(fn x -> String.to_integer(x) end)
      |> Enum.with_index()

    size_entries = Enum.count(entries)

    res =
      Enum.map(entries, fn({x, idx}) ->
        Enum.filter(entries, fn ({y, _idy}) ->
          x2 =
          case Enum.at(entries, idx+1) do
            {x2, _idx2} -> x2
            nil ->
              {v, 0} = Enum.at(entries, size_entries - (idx+1))
              v
          end

          if(y != x && y != x2 )do
            sum = x + x2 + y
            # IO.inspect("Indice de X: #{idx}, Indice de Y: #{idy}")
            IO.inspect("#{x} + #{x2} + #{y} = #{sum}")
            x + x2 + y == 2020
          end
        end)
      end)

    Enum.each(res, fn x -> IO.inspect(x) end)
  end

end
