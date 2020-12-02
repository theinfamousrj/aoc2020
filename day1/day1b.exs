{:ok, body} = File.read("input1")

lines = String.split(body, "\n", trim: true)

lines
|> Enum.with_index
|> Enum.each(fn({x,i}) -> 
  lines
  |> Enum.with_index
  |> Enum.each(fn({y,j}) -> 
    lines
    |> Enum.with_index
    |> Enum.each(fn({z,k}) -> 
      {intX, blahX} = Integer.parse(x)
      {intY, blahY} = Integer.parse(y)
      {intZ, blahZ} = Integer.parse(z)
      
      sum = intX + intY + intZ
      mul = intX * intY * intZ
      
      if sum == 2020 do
        IO.puts("#{i} & #{j} & #{k}")
        IO.puts("#{x} + #{y} + #{z} = #{sum}")
        IO.puts("#{x} * #{y} * #{z} = #{mul}")
      end
    end)
  end)
end)
