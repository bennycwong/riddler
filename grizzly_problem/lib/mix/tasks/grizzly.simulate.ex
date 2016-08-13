defmodule Mix.Tasks.Grizzly.Simulate do
  use Mix.Task
  alias GrizzlySimulation

  @shortdoc "Run the Grizzly Problem Simluation"
  def run(_) do
    significance = get_significance

    dir = "results/grams/"
    filename = "grizzly-results-#{significance}.csv"
    path = dir <> filename

    if !File.dir?(dir), do: File.mkdir(dir)
    if File.exists?(path), do: File.rm!(path)
    #Write Header
    IO.puts "Creating #{path} File ..."
    File.write!(path, "Threshold,EV,Hours,Significance\n", [:append])

    IO.puts "Running Simluation..."

    threshold_range = 1..1000
    hours_range = 1..15

    hours_range
    |> Enum.map(
      fn hours ->
        simulate_grizzly(threshold_range, hours, significance, path)
      end
      )
  end

  defp simulate_grizzly(threshold_range, hours, significance, path) do
    threshold_range
    |> Enum.map(
        fn threshold ->
          %{
            threshold: threshold,
            ev: GrizzlySimulation.map_threshold_tuple(hours, threshold, significance),
            hours: hours,
            significance: significance
          }
          |> export_result(path)
        end
      )
  end

  defp ask_for_significance do
    IO.gets "How many times to run the simluation? Higher means more accurate expected value, but slower? [Please Enter Integer]\n"
  end

  defp get_significance do
    ask_for_significance
    |> String.trim_trailing("\n")
    |> String.to_integer
  end

  defp export_result(result, path) do
    IO.puts "Simulating for #{result.hours} hours expedition at threshold: #{result.threshold} ..."
    File.write!(path, "#{result.threshold},#{result.ev},#{result.hours},#{result.significance}\n", [:append])
  end

end
