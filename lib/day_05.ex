defmodule Day05 do
  @binary_base 2
  @initial_lower_limit 1
  @heaviest_weight 7
  @heaviest_weight_column 3
  @factor_id 8

  @doc """
  ## Examples
      iex> Day05.get_highest_id("/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/advent_of_code_2020/lib/resources/day_05/input_05.txt")
      883
  """
  def get_highest_id(path_entries) do
    {:ok, contents} = File.read(path_entries)

    contents
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> get_id(x) end)
    # |> Enum.sort()
    |> Enum.max()
  end

  @doc """
  ## Examples
      iex> Day05.decoding("FBFBBFFRLR")
      357
  """
  def get_id(boarding_pass) do
    row = get_row(boarding_pass)
    column = get_column(boarding_pass)
    row * @factor_id + column
  end

  def get_row(boarding_pass) do
    rows = String.slice(boarding_pass, 0..(String.length(boarding_pass) - 4))

    rows
    |> String.graphemes() #["F", "B", "F", "B", "B", "F", "F"]
    |> calculate_row(@initial_lower_limit)
  end

  def get_column(boarding_pass) do
    columns = String.slice(boarding_pass, @heaviest_weight..String.length(boarding_pass))

    columns
    |> String.graphemes()
    |> calculate_column(@initial_lower_limit)
  end

  def calculate_column([h|t], idx) when idx == @initial_lower_limit do
    peso = @heaviest_weight_column
    half = pow(@binary_base, peso - 1)

    lower_limit = @initial_lower_limit
    upper_limit = pow(@binary_base, peso)

    {x1, x2} = filter_range(lower_limit, upper_limit, half, h)
    # IO.inspect("IDX: #{idx}, Valor: #{h}, Peso: #{peso}, Rango: {#{x1}, #{x2}}, Half: #{half}")
    calculate_column(t, idx+1, [{x1, x2}])
  end

  def calculate_column(list, @heaviest_weight_column, acc) do
    {x1, x2} = List.last(acc)
    value = List.last(list)

    {x3, x4} = filter_range(x1, x2, 1, value)
    # IO.inspect("IDX: #{@heaviest_weight_column}, Valor: #{value}, Peso: #{@initial_lower_limit}, Rango: {#{x3}, #{x4}}, Half: #{@initial_lower_limit}")

    case value do
      "L" -> x3
      "R" -> x4 - @initial_lower_limit
    end
  end

  def calculate_column([h|t], idx, acc) do
    peso = Enum.count(t) + 1
    half = pow(@binary_base, peso - 1)

    {lower_limit, upper_limit} = Enum.at(acc, idx-2)
    {x1, x2} = filter_range(lower_limit, upper_limit, half, h)

    # IO.inspect("IDX: #{idx}, Valor: #{h}, Peso: #{peso}, Rango: {#{x1}, #{x2}}, Half: #{half}")
    calculate_column(t, idx+1, acc ++[{x1, x2}])
  end

  @spec calculate_row([<<_::8>>, ...], integer) :: no_return
  def calculate_row([h|t], idx) when idx == @initial_lower_limit do
    peso = @heaviest_weight
    half = pow(@binary_base, peso - 1)

    lower_limit = @initial_lower_limit
    upper_limit = pow(@binary_base, peso)

    {x1, x2} = filter_range(lower_limit, upper_limit, half, h)
    # IO.inspect("IDX-CERO: #{idx}, Valor: #{h}, Peso: #{peso}, Rango: {#{x1}, #{x2}}, Half: #{half}")
    calculate_row(t, idx+1, [{x1, x2}])
  end

  def calculate_row(lista, @heaviest_weight, acc) do
    {x1, x2} = List.last(acc)
    value = List.last(lista)

    {x3, x4} = filter_range(x1, x2, @initial_lower_limit, value)
    case value do
      "F" -> x3
      "B" -> x4-1
    end
  end

  def calculate_row([h|t], idx, acc) do
    peso = Enum.count(t) + 1
    half = pow(@binary_base, peso - 1)

    {lower_limit, upper_limit} = Enum.at(acc, idx-2)
    {x1, x2} = filter_range(lower_limit, upper_limit, half, h)

    # IO.inspect("IDX: #{idx}, Valor: #{h}, Peso: #{peso}, Rango: {#{x1}, #{x2}}, Half: #{half}")
    calculate_row(t, idx+1, acc ++[{x1, x2}])
  end

  def filter_range(lower_limit, _, half, value) when value == "F" or value == "L" do
    # IO.inspect("PARA F: lower_limit:#{lower_limit}, upper_limit: #{upper_limit}, half:#{half}")
    new_lower_limit =
      case lower_limit do
        @initial_lower_limit -> lower_limit
        _ -> lower_limit
      end

    new_upper_limit =
      case lower_limit do
        1 -> half
        _ -> lower_limit + half
      end
    {new_lower_limit, new_upper_limit}
  end

  def filter_range(lower_limit, upper_limit, half, value) when value == "B"  or value == "R" do
    # IO.inspect("PARA B: lower_limit:#{lower_limit}, upper_limit: #{upper_limit}, half:#{half}")
    new_lower_limit =
      case lower_limit do
        @initial_lower_limit -> half
        _ -> lower_limit + half
      end

    new_upper_limit = upper_limit
    {new_lower_limit, new_upper_limit}
  end

  def pow(base, 1), do: base
  def pow(base, exp), do: base * pow(base, exp - 1)

end
