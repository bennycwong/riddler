defmodule GrizzlySimulation do

  def expected_value(hours, threshold, significance) do
    1..significance |> Enum.map(fn _ -> GrizzlyProblem.expedition(hours, threshold) end) |> avg_number_from_list
  end

  def avg_number_from_list(list) do
    list |> Enum.sum |> div(length(list))
  end

  def map_threshold_tuple(hours, threshold, significance) do
    {threshold, expected_value(hours, threshold, significance) }
    expected_value(hours, threshold, significance)
  end
end
