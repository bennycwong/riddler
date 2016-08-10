Code.load_file("grizzly_simulation.ex")
defmodule GenerateEV do

  def get_hours do
    IO.gets "Expedition length in hours (how many fishes will you see)? [Please Enter Integer]\n"
  end

  def get_significance do
    IO.gets "How many times to run this to generate an Expected Value? [Please Enter Integer]\n"
  end

end

# Run simulations here

#How many fishes will you see?
hours = GenerateEV.get_hours
  |> String.trim_trailing("\n")
  |> String.to_integer

#How many times to run this to generate an Expected Value
significance = GenerateEV.get_significance
  |> String.trim_trailing("\n")
  |> String.to_integer

threshold_range = 1..1000 #What's the range you want to test?

results = threshold_range
|> Enum.map(
    fn threshold ->
      {threshold, GrizzySimulation.map_threshold_tuple(hours, threshold, significance), hours, significance}   |> Tuple.to_list |> Enum.join(",")
    end
  )

path = "results/ev-#{hours}-#{significance}.csv"

if File.exists?(path), do: File.rm!(path)

#Write Header
File.write!(path, "Threshold,EV,Hours,Significance\n", [:append])

results |> Enum.map(
  fn result ->
    File.write!(path, "#{result}\n", [:append])
  end
)
