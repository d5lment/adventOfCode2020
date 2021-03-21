defmodule Day06Test do
  use ExUnit.Case
  doctest Day06

  sample_path_entries = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/advent_of_code_2020/lib/resources/day_06/input_06_sample.txt"
  path_entries = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/advent_of_code_2020/lib/resources/day_06/input_06.txt"

  test_data = [
    {1, sample_path_entries, 11},
    {2, sample_path_entries, 6387}]


  for {index, file, total} <- test_data do
    @index index
    @file file
    @total @file
    test "#{@index} For each group, count the number of questions to which anyone answered yes. What is the sum of those counts?"do
      assert Day06.count_yes_questions(@file) == @file
    end
  end

end
