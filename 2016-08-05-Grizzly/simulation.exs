Code.load_file("grizzly_simulation.ex")
#Run simulations here

#Setup Variables Here:
hours = 2 #How many fishes will you see?
significance = 10 #How many times to run this to generate an Expected Value
threshold_range = 1..1000 #What's the range you want to test?

results = threshold_range
|> Enum.map(
    fn threshold ->
      GrizzySimulation.map_threshold_tuple(hours, threshold, significance)
    end
  )

#Used for exporting results
max = results |> Enum.max()
index_at_max = results |> Enum.find_index(fn x -> x == max end)
threshold_at_max = (threshold_range |> Enum.to_list |> hd) + index_at_max

#Used for exporting range
range = %{first:
            threshold_range
            |> Enum.to_list
            |> hd,
          last:
            threshold_range
            |> Enum.to_list
            |> List.last
            }

#Writes the result to results.csv
File.write!("results/results.csv", "#{threshold_at_max},#{max},#{hours},#{significance},#{range.first}..#{range.last}\n", [:append])
