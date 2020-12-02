{:ok, body} = File.read("input1")

lines = String.split(body, "\n", trim: true)

lines
|> Enum.with_index
|> Enum.each(fn({x,i}) -> 
  lines
  |> Enum.with_index
  |> Enum.each(fn({y,j}) -> 
    {intX, blahX} = Integer.parse(x)
    {intY, blahY} = Integer.parse(y)
    
    sum = intX + intY
    mul = intX * intY
    
    if intX + intY == 2020 do
      IO.puts("#{i} & #{j}")
      IO.puts("#{x} + #{y} = #{sum}")
      IO.puts("#{x} * #{y} = #{mul}")
    end
  end)
end)
