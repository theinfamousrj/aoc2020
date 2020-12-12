{:ok, body} = File.read("input4")

lines = String.split(body, "\n\n", trim: true)

lines
|> Enum.with_index
|> Enum.map(fn({line, index}) ->

byr = line =~ ~r/byr:((19[2-9][0-9])|(200[0-2]))/ # (Birth Year)
iyr = line =~ ~r/iyr:((201[0-9])|(2020))/ # (Issue Year)
eyr = line =~ ~r/eyr:((202[0-9])|(2030))/ # (Expiration Year)
hgt = line =~ ~r/hgt:(((1[5-8][0-9]|19[0-3])cm)|((59|6[0-9]|7[0-6])in))/ # (Height)
hcl = line =~ ~r/hcl:#[0-9a-f]{6}/ # (Hair Color)
ecl = line =~ ~r/ecl:(amb|blu|brn|gry|grn|hzl|oth)/ # (Eye Color)
pid = line =~ ~r/pid:\d{9}/ # (Passport ID)
# cid = line =~ ~r/cid:/ # (Country ID)

  if byr && iyr && eyr && hgt && hcl && ecl && pid do
    "!"
  else
    "."
  end

end)
|> Enum.filter(fn(item) -> item != "." end)
|> length
|> IO.puts
