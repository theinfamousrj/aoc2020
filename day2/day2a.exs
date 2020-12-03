{:ok, body} = File.read("input2")

lines = String.split(body, "\n", trim: true)

lines
|> Enum.map(fn(line) ->

  [range, letterColon, password] = String.split(line, "\s", trim: false)
  [min, max] = String.split(range, "-", trim: false) 
  |> Enum.map(fn(s) -> {num, _} = Integer.parse(s); num end)
  letter = String.split(letterColon, ":", trim: false)

  letterCount = password |> String.graphemes |> Enum.count(& &1 == "#{letter}")

  if letterCount >= min && letterCount <= max do
    "#{min}, #{max}, #{letter}, #{password}, #{letterCount}"
  end

end)
|> Enum.filter(fn(item) -> item != nil end)
|> length
|> IO.puts
