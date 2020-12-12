{:ok, body} = File.read("input4")

lines = String.split(body, "\n\n", trim: true)

lines
|> Enum.with_index
|> Enum.map(fn({line, index}) ->

byr = line =~ ~r/byr/ # (Birth Year)
iyr = line =~ ~r/iyr/ # (Issue Year)
eyr = line =~ ~r/eyr/ # (Expiration Year)
hgt = line =~ ~r/hgt/ # (Height)
hcl = line =~ ~r/hcl/ # (Hair Color)
ecl = line =~ ~r/ecl/ # (Eye Color)
pid = line =~ ~r/pid/ # (Passport ID)

  if byr && iyr && eyr && hgt && hcl && ecl && pid do
    "!"
  else
    "."
  end

end)
|> Enum.filter(fn(item) -> item != "." end)
|> length
|> IO.puts
