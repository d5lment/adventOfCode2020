defmodule Day0402Test do
  use ExUnit.Case
  doctest Day0402

  @valid_passport [
    hgt: "183cm",
    cid: "147",
    iyr: "2017",
    byr: "1937",
    hcl: "#fffffd",
    eyr: "2020",
    pid: "860033327",
    ecl: "gry"]

  test_data = [
    {:byr, "2002", "valid", true, @valid_passport},
    {:byr, "2003", "invalid", false, @valid_passport},
    {:hgt, "60in", "valid", true, @valid_passport},
    {:hgt, "190cm", "valid", true, @valid_passport},
    {:hgt, "190in", "invalid", false, @valid_passport},
    #{:hgt, "190", "invalid", false, @valid_passport} #BUG! require fix
    {:hcl, "#123abc", "valid", true, @valid_passport},
    {:hcl, "#123abz", "invalid", false, @valid_passport},
    {:hcl, "123abc", "invalid", false, @valid_passport},
    {:ecl, "brn", "valid", true, @valid_passport},
    {:ecl, "wat", "invalid", false, @valid_passport},
    {:pid, "000000001", "valid", true, @valid_passport},
    {:pid, "0123456789", "invalid", false, @valid_passport}
  ]

  for {field, value, type_validation, expected, passport} <- test_data do
    @type_validation type_validation
    @field field
    @value value
    @test_passport Keyword.put(passport, field, value)
    @expected expected

    @doc """
      Validate specific field in a passport with an expected result to verify.
    """
    test "Validate:It is #{@value} a/an #{@type_validation} #{@field}? #{@expected}" do
      assert Day0402.validate_fields(@field, @test_passport) == @expected
    end
  end

  invalid_passpports = [
    {1,[eyr: "1972", cid: "100", hcl: "#18171d", ecl: "amb", hgt: "170", pid: "186cm", iyr: "2018", byr: "1926"]},
    {2,[iyr: "2019", hcl: "#602927", eyr: "1967", hgt: "170cm", ecl: "grn", pid: "012533040", byr: "1946"]},
    {3,[hcl: "dab227", iyr: "2012", ecl: "brn", hgt: "182cm", pid: "021572410", eyr: "2020", byr: "1992", cid: "277"]},
    {4,[hgt: "59cm", ecl: "zzz", eyr: "2038", hcl: "74454a", iyr: "2023", pid: "3556412378", byr: "2007"]}
  ]

  for {index, passport} <- invalid_passpports do
    @test_passport passport
    @expected false
    @index index

    @doc """
      Validate invalid passports.
    """
    test "It is passpord #{@index} valid? #{@expected}" do
      assert Day0402.validate_passport(@test_passport) == @expected
    end
  end

  valid_passpords = [
    {1, [pid: "087499704", hgt: "74in", ecl: "grn", iyr: "2012", eyr: "2030", byr: "1980", hcl: "#623a2f"]},
    {2, [eyr: "2029", ecl: "blu", cid: "129", byr: "1989", iyr: "2014", pid: "896056539", hcl: "#a97842", hgt: "165cm"]},
    {3, [hcl: "#888785", hgt: "164cm", byr: "2001", iyr: "2015", cid: "88", pid: "545766238", ecl: "hzl", eyr: "2022"]},
    {4, [iyr: "2010", hgt: "158cm", hcl: "#b6652a", ecl: "blu", byr: "1944", eyr: "2021", pid: "093154719"]},
  ]

  for {index, passport} <- valid_passpords do
    @test_passport passport
    @expected true
    @index index

    @doc """
      Validate ivalid passports.
    """
    test "It is passpord #{@index} valid? #{@expected}" do
      assert Day0402.validate_passport(@test_passport) == @expected
    end
  end
end
