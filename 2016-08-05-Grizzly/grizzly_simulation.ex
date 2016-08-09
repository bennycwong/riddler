Code.load_file("grizzly.ex")

defmodule GrizzySimulation do

  def simulate(hours, threshold), do: GrizzlyProblem.expedition(hours,threshold)

  def expected_value(hours, threshold, significance) do
    1..significance |> Enum.map(fn _ -> simulate(hours, threshold) end) |> avg_number_from_list
  end

  def avg_number_from_list(list) do
    list |> Enum.sum |> div(length(list))
  end

  def map_threshold_tuple(hours, threshold, significance) do
    {threshold, GrizzySimulation.expected_value(hours, threshold, significance) }
    GrizzySimulation.expected_value(hours, threshold, significance)
  end
end
