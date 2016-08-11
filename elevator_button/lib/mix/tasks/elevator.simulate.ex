defmodule Mix.Tasks.Elevator.Simulate do
  use Mix.Task
  alias ElevatorButton

  @shortdoc "Run the Elevator Button Simluation"
  def run(_) do

    max_people = get_max_people
    max_floors = get_max_floors
    significance = get_significance

    IO.puts "Running Simluation..."

    dir = "results"
    create_results_diretory(dir)
    path = "#{dir}/elevator-#{max_people}-#{max_floors}-#{significance}.csv"
    start_new_file(path, max_floors)
    run_simluation(max_people, max_floors, significance, path)

    IO.puts "Simluation Complete!"
    IO.puts "Find results at #{path}"
  end

  defp run_simluation(max_people, max_floors, significance, path) do
    1..max_people
    |> Enum.map(fn people -> %{people: people, floors: 1..max_floors |> Enum.to_list} end)
    |> Enum.map(fn data -> data.floors
                           |> Enum.map(fn floors -> get_expected_value(significance, data.people, floors) end )
                           |> List.insert_at(0, "#{data.people} People") |> Enum.join(",")
                           |> export_results(path)
                end)

  end

  defp ask_for_max_people do
    IO.gets "Run the simluation for up to how many people? [Please Enter Integer]\n"
  end

  defp get_max_people do
    ask_for_max_people
    |> String.trim_trailing("\n")
    |> String.to_integer
  end
  defp ask_for_max_floors do
    IO.gets "Run the simluation for up to how many floors? [Please Enter Integer]\n"
  end

  defp get_max_floors do
    ask_for_max_floors
    |> String.trim_trailing("\n")
    |> String.to_integer
  end

  defp ask_for_significance do
    IO.gets "How many times to run the simluation? Higher means more accurate expected value, but slower? [Please Enter Integer]\n"
  end

  defp get_significance do
    ask_for_significance
    |> String.trim_trailing("\n")
    |> String.to_integer
  end

  defp get_expected_value(significance, how_many_people, floors) do
    1..significance
    |> Enum.map(fn _ ->
      ElevatorButton.simluate(how_many_people, floors)
    end)
    |> Enum.sum
    |> div(significance)
  end
  defp results_dir_exist? do
    File.dir?("results")
  end

  defp create_results_diretory(dir) do
    if !results_dir_exist?, do: File.mkdir(dir)
  end

  defp start_new_file(path, floors) do
    if File.exists?(path), do: File.rm!(path)
    header = 1..floors |> Enum.to_list |> Enum.map(&( "#{&1|>Integer.to_string} Floors" ))|> Enum.join(",")
    File.write!(path, "EV Chart,#{header}\n", [:append])
  end

  defp export_results(row, path) do
    IO.puts "Simulating #{row |> String.split(",") |> List.first}..."
    File.write!(path, "#{row}\n", [:append])
  end
end
