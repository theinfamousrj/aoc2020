{:ok, body} = File.read("input3")

lines = String.split(body, "\n", trim: true)

lines
|> Enum.with_index
|> Enum.map(fn({line, index}) ->

  mod = 1
  len = 31

  modIndex = index * mod

  if modIndex > len do
    a = String.at(line, rem(modIndex, len))
    "#{a}"
  else
    a = String.at(line, modIndex)
    "#{a}"
  end

end)
|> Enum.filter(fn(item) -> item != "." end)
|> length
|> IO.puts
