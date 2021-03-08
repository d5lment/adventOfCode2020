defmodule Day05 do
  @binary_base 2
  @initial_lower_limit 1
  @heaviest_weight 7

  def get_row() do
    boarding_pass = "FBFBBFFRLR"
    rows = String.slice(boarding_pass, 0..(String.length(boarding_pass) - 4))

    rows
    |> String.graphemes() #["F", "B", "F", "B", "B", "F", "F"]
    |> calculate_row(@initial_lower_limit)
  end

  def get_column() do
    boarding_pass = "FBFBBFFRLR"
    columns = String.slice(boarding_pass, 7..String.length(boarding_pass))

    columns
    |> String.graphemes()

  end

  @spec calculate_row([<<_::8>>, ...], integer) :: no_return
  def calculate_row([h|t], idx) when idx == @initial_lower_limit do
    peso = @heaviest_weight
    half = pow(@binary_base, peso - 1)

    lower_limit = @initial_lower_limit
    upper_limit = pow(@binary_base, peso)

    {x1, x2} = filter_range(lower_limit, upper_limit, half, h)
    IO.inspect("IDX-CERO: #{idx}, Valor: #{h}, Peso: #{peso}, Rango: {#{x1}, #{x2}}, Half: #{half}")
    calculate_row(t, idx+1, [{x1, x2}])
  end

  def calculate_row(_list, @heaviest_weight, acc) do
    {x1, _x2} = List.last(acc)
    x1 + 1
  end

  def calculate_row([h|t], idx, acc) do
    peso = Enum.count(t) + 1
    half = pow(@binary_base, peso - 1)

    {lower_limit, upper_limit} = Enum.at(acc, idx-2)
    {x1, x2} = filter_range(lower_limit, upper_limit, half, h)

    IO.inspect("IDX: #{idx}, Valor: #{h}, Peso: #{peso}, Rango: {#{x1}, #{x2}}, Half: #{half}")
    calculate_row(t, idx+1, acc ++[{x1, x2}])
  end

  def filter_range(lower_limit, _, half, "F") do
    # IO.inspect("PARA F: lower_limit:#{lower_limit}, upper_limit: #{upper_limit}, half:#{half}")
    new_lower_limit =
      case lower_limit do
        1 -> lower_limit
        _ -> lower_limit
      end
    new_upper_limit =
      case lower_limit do
        1 -> half
        _ -> lower_limit + half
      end
    {new_lower_limit, new_upper_limit}
  end

  def filter_range(lower_limit, upper_limit, half, "B") do
    # IO.inspect("PARA B: lower_limit:#{lower_limit}, upper_limit: #{upper_limit}, half:#{half}")
    new_lower_limit =
      case lower_limit do
        1 -> half
        _ -> lower_limit + half
      end

    new_upper_limit = upper_limit
    {new_lower_limit, new_upper_limit}
  end

  def pow(base, 1), do: base
  def pow(base, exp), do: base * pow(base, exp - 1)

end
