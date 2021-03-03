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
end
