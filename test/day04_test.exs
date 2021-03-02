defmodule Day04Test do
  use ExUnit.Case
  doctest Day04

  setup do
    full_valid_passport = get_full_valid_passport()
    invalid_passport = get_invalid_passport_missing_hgt()

    valid_North_Pole_Credentials = get_valid_North_Pole_Credentials()
    invalid_passport2 = get_invalid_passport()

    sample_path_entries = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/advent_of_code_2020/lib/resources/day_04/input_04_sample.txt"

    {:ok,
      full_valid_passport: full_valid_passport,
      invalid_passport: invalid_passport,
      valid_North_Pole_Credentials: valid_North_Pole_Credentials,
      invalid_passport2: invalid_passport2,
      sample_path_entries: sample_path_entries}
  end

  test "Report 2 valid passports from sample input", %{sample_path_entries: sample_path_entries} do
    assert Day04.get_total_valid_passports(sample_path_entries) == 2
  end

  test "validate an incomplete and invalid passport", %{invalid_passport2: invalid_passport2} do
    assert Day04.validate_passport(invalid_passport2) == false
  end

  test "validate a complete valid passport", %{full_valid_passport: full_valid_passport} do
    assert Day04.validate_passport(full_valid_passport) == true
  end

  test "validate an incomplete passport", %{invalid_passport: invalid_passport} do
    assert Day04.validate_passport(invalid_passport) == false
  end

  test "validate a valid North Pole Credential", %{valid_North_Pole_Credentials: valid_North_Pole_Credentials} do
    assert Day04.validate_passport(valid_North_Pole_Credentials) == true
  end

  defp get_invalid_passport()do
    # The fourth passport is missing two fields, cid and byr. Missing cid is fine,
    # but missing any other field is not, so this passport is invalid.
    [
      hgt: "59in",
      ecl: "brn",
      iyr: "2011",
      pid: "166559648",
      eyr: "2025",
      hcl: "#cfa07d"
    ]
  end

  defp get_valid_North_Pole_Credentials() do
    # The third passport is interesting; the only missing field is cid, so it looks like data from North Pole Credentials,
    # not a passport at all! Surely, nobody would mind if you made the system temporarily ignore missing cid fields.
    # Treat this "passport" as valid.
    [
      hgt: "179cm",
      byr: "1931",
      pid: "760753108",
      ecl: "brn",
      eyr: "2024",
      iyr: "2013",
      hcl: "#ae17e1"
    ]
  end

  defp get_invalid_passport_missing_hgt() do
    # Passport is invalid - it is missing hgt (the Height field).
    [
      byr: "1929",
      hcl: "#cfa07d",
      pid: "028048884",
      eyr: "2023",
      cid: "350",
      ecl: "amb",
      iyr: "2013"
    ]
  end

  defp get_full_valid_passport() do
    # The first passport is valid - all eight fields are present.
    [
      hgt: "183cm",
      cid: "147",
      iyr: "2017",
      byr: "1937",
      hcl: "#fffffd",
      eyr: "2020",
      pid: "860033327",
      ecl: "gry"
    ]
  end

  # [
    #   ["ecl:gry", "pid:860033327", "eyr:2020", "hcl:#fffffd", "byr:1937","iyr:2017", "cid:147", "hgt:183cm"],
    #   ["iyr:2013", "ecl:amb", "cid:350", "eyr:2023", "pid:028048884", "hcl:#cfa07d","byr:1929"],
    #   ["hcl:#ae17e1", "iyr:2013", "eyr:2024", "ecl:brn", "pid:760753108","byr:1931", "hgt:179cm"],
    #   ["hcl:#cfa07d", "eyr:2025", "pid:166559648", "iyr:2011", "ecl:brn","hgt:59in"]
    # ]

    # orders_id =
    #   Enum.reduce(deliveries, [], fn delivery, acc ->
    #     acc ++ [delivery.order_id]
    #   end)

    # |> Enum.map(fn x ->
    #     for val <- x, into: [], do: String.to_atom(val)
    #   end)

    # row = ["ecl:gry", "pid:860033327", "eyr:2020", "hcl:#fffffd", "byr:1937", "iyr:2017", "cid:147", "hgt:183cm"]
    # for val <- row, into: [], do: String.to_atom(val)
    # [
    #   ["ecl", "gry"],
    #   ["pid", "860033327"],
    #   ["eyr", "2020"],
    #   ["hcl", "#fffffd"],
    #   ["byr", "1937"],
    #   ["iyr", "2017"],
    #   ["cid", "147"],
    #   ["hgt", "183cm"]
    # ]

# #5 Pasar de esto (una lista de elementos)
# ["ecl:gry", "pid:860033327", "eyr:2020", "hcl:#fffffd", "byr:1937", "iyr:2017", "cid:147", "hgt:183cm"]
# a esto una key value list
# [ecl: "gry", pid:"860033327", eyr:"2020", hcl:"#fffffd", byr:"1937", iyr:"2017", cid:"147", hgt:"183cm"]

# #4 Obtener una lista de listas donde cada elemento correspindera a la llave del campo : valor del campo
# [
#   ["ecl:gry", "pid:860033327", "eyr:2020", "hcl:#fffffd", "byr:1937", "iyr:2017", "cid:147", "hgt:183cm"],
#   ["iyr:2013", "ecl:amb", "cid:350", "eyr:2023", "pid:028048884", "hcl:#cfa07d", "byr:1929"],
#   ["hcl:#ae17e1", "iyr:2013", "eyr:2024", "ecl:brn", "pid:760753108", "byr:1931", "hgt:179cm"],
#   ["hcl:#cfa07d", "eyr:2025", "pid:166559648", "iyr:2011", "ecl:brn","hgt:59in"]
# ]

# #3 Eliminar de cada elemento de la lista los espacios vacios y reemplazar por salto de línea
# ["ecl:gry\npid:860033327\neyr:2020\nhcl:#fffffd\nbyr:1937\niyr:2017\ncid:147\nhgt:183cm",
#  "iyr:2013\necl:amb\ncid:350\neyr:2023\npid:028048884\nhcl:#cfa07d\nbyr:1929",
#  "hcl:#ae17e1\niyr:2013\neyr:2024\necl:brn\npid:760753108\nbyr:1931\nhgt:179cm",
#  "hcl:#cfa07d\neyr:2025\npid:166559648\niyr:2011\necl:brn\nhgt:59in"]

# #2 Separar la cadena utilizando los renglones vacios como separador y obtener una lista
# ["ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm",
#  "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884 hcl:#cfa07d byr:1929",
#  "hcl:#ae17e1 iyr:2013\neyr:2024\necl:brn pid:760753108 byr:1931\nhgt:179cm",
#  "hcl:#cfa07d eyr:2025 pid:166559648\niyr:2011 ecl:brn hgt:59in"]

# #1 Obtener las entradas del archivo (tal como existen)
#     {:ok,
#  "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd\nbyr:1937 iyr:2017 cid:147 hgt:183cm
#  \n\niyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884\nhcl:#cfa07d byr:1929
#  \n\nhcl:#ae17e1 iyr:2013\neyr:2024\necl:brn pid:760753108 byr:1931\nhgt:179cm
#  \n\nhcl:#cfa07d eyr:2025 pid:166559648\niyr:2011 ecl:brn hgt:59in"}
end
