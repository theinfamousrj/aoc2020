{:ok, body} = File.read("input2")

lines = String.split(body, "\n", trim: true)

lines
|> Enum.map(fn(line) ->

  [range, letterColon, password] = String.split(line, "\s", trim: false)
  [min, max] = String.split(range, "-", trim: false) 
  |> Enum.map(fn(s) -> {num, _} = Integer.parse(s); num end)
  letter = String.split(letterColon, ":", trim: true)

  minStr = String.at(password, min-1)
  maxStr = String.at(password, max-1)

  cond do
  "#{minStr}" == "#{letter}" and "#{maxStr}" != "#{letter}" ->
    "#{min}, #{max}, #{letter}, #{password}"
  "#{minStr}" != "#{letter}" and "#{maxStr}" == "#{letter}" ->
    "#{min}, #{max}, #{letter}, #{password}"
  true ->
    nil
  end

end)
|> Enum.filter(fn(item) -> item != nil end)
|> length
|> IO.puts
