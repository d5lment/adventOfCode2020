defmodule Day08Test do
  @moduledoc """
  Tests for `Day 08`.
  """

  use ExUnit.Case
  doctest Day08

  test "Get entries from file to day 08" do
    path = "lib/resources/day_08/input_08_sample.txt"
    entries = Day08.get_entries(path)

    assert [h|t] = entries

    Enum.each(entries, fn entry ->
      assert is_tuple(entry)
    end)

    assert [
      {:nop, "+", 0},
      {:acc, "+", 1},
      {:jmp, "+", 4},
      {:acc, "+", 3},
      {:jmp, "-", 3},
      {:acc, "-", 99},
      {:acc, "+", 1},
      {:jmp, "-", 4},
      {:acc, "+", 6}
    ] = entries
  end

  valid_items_data = [
    {1, "nop +0", {:nop, "+", 0}},
    {2, "acc +1", {:acc, "+", 1}},
    {3, "jmp +4", {:jmp, "+", 4}},
    {4, "acc +3", {:acc, "+", 3}},
    {5, "jmp -3", {:jmp, "-", 3}},
    {6, "acc -99", {:acc, "-", 99}},
    {7, "acc +1", {:acc, "+", 1}},
    {8, "jmp -4", {:jmp, "-", 4}},
    {9, "acc +6", {:acc, "+", 6}},
  ]

  for {index, string_value, expected_result} <- valid_items_data do
    @index index
    @expected_result expected_result
    @string_value string_value

    @doc """
      Convert a valid value to an entry ready to use.
    """
    test "Test#{@index} Convert #{@string_value} to tupple as: {operation, sign, value}" do
      position_operation = 0
      position_sign = 1
      position_value = 2

      {operation, sign, value} = Day08.itemize(@string_value)

      assert is_atom(operation)
      expected_operation = elem(@expected_result, position_operation)
      assert expected_operation
      assert expected_operation = operation

      assert is_binary(sign)
      expected_sign = elem(@expected_result, position_sign)
      assert expected_sign
      assert expected_sign = sign

      assert is_integer(value)
      expected_value = elem(@expected_result, position_value)
      assert expected_value
      assert expected_value = value
    end
  end

  valid_value_data = [
    {0, "+0"},
    {45, "+45"},
    {123, "-123"},
    {12, "-12"},
  ]

  for {value_expected, value} <- valid_value_data do
    @value_expected value_expected
    @value value

    @doc """
      Get a valid sign
    """
    test "Getting a valid value to: #{@value}" do
      resulting_value = Day08.get_value(@value)
      assert is_integer(resulting_value)
      assert @value_expected = resulting_value
    end
  end

  valid_sign_data = [
    {"+", "+0"},
    {"+", "+12"},
    {"-", "-3"},
    {"-", "-123"},
  ]

  for {sign, value} <- valid_sign_data do
    @sign sign
    @value value

    @doc """
      Get a valid sign
    """
    test "Get a valid sign: to value #{@value}" do
      resulting_sign = Day08.get_sign(@value)
      assert is_binary(resulting_sign)
      assert @sign = resulting_sign
    end
  end

  valid_operation_data = [
    {:nop, "nop"},
    {:acc, "acc"},
    {:jmp, "jmp"},
    {:error, "otro"}
  ]

  for {operation, value} <- valid_operation_data do
    @operation operation
    @value value

    @doc """
      Get a valid atom for operations
    """
    test "Get a valid operation: to value #{@value}" do
      resulting_operation = Day08.get_operation(@value)
      assert is_atom(resulting_operation)
      assert @operation = resulting_operation
    end
  end

  # STEP 1: "nop +0\nacc +1\njmp +4\nacc +3\njmp -3\nacc -99\nacc +1\njmp -4\nacc +6"
  # STEP 2: ["nop +0", "acc +1", "jmp +4", "acc +3", "jmp -3", "acc -99", "acc +1","jmp -4", "acc +6"]
  # STEP 3: Convertir cada elemento del arreglo en su llave y valor: "nop +0" = {:nop, "+", 0}
end
