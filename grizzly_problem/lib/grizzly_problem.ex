defmodule GrizzlyProblem do

  def expedition(length, threshold_in_grams, fish_list \\ nil) do
    fish_list = fish_list || gen_multiple_fish(length)
    fish_list
    |> process_fishes(threshold_in_grams)
    |> map_weight_of_current_fish
    |> sum_weight_of_fish
  end

  def generate_fish_in_grams do
    %{unit: :grams, weight: generate_fish_in_milligrams.weight |> div(1000)}
  end

  def generate_fish_in_milligrams do
    %{unit: :milligrams, weight: generate_fish_in_micrograms.weight |> div(1000)}
  end

  def generate_fish_in_micrograms do
    %{unit: :micrograms, weight: generate_fish_in_nanograms.weight |> div(1000)}
  end

  def generate_fish_in_nanograms do
    %{unit: :nanograms, weight: generate_fish_in_picograms.weight |> div(1000)}
  end

  def generate_fish_in_picograms do
    %{unit: :picograms, weight: Enum.random(1..1_000_000_000_000_000)}
  end

  def eat_fish?(first_fish, threshold_in_grams) when is_integer(threshold_in_grams) do
    %{consumed: first_fish.weight < threshold_in_grams, current_fish: first_fish}
  end

  def eat_fish?(current_fish, largest_fish_consumed) do
    %{consumed: current_fish.weight >= largest_fish_consumed.weight, current_fish: current_fish}
  end

  def gen_multiple_fish(n) when n <= 1 do
    [] |> List.insert_at(0, generate_fish_in_grams)
  end

  def gen_multiple_fish(n) do
    gen_multiple_fish(n-1) |> List.insert_at(0, generate_fish_in_grams)
  end

  def sum_weight_of_fish(list) do
    Enum.reduce(list, 0, &(&1 + &2))
  end

  def map_weight_of_current_fish(list) do
    Enum.map(list, &(&1 |> added_weight_of_current_fish))
  end

  def added_weight_of_current_fish(element) do
    case element.consumed do
      true -> element.current_fish.weight
      _ -> 0
    end
  end

  def process_fishes([head | tail], threshold_in_grams) when is_integer(threshold_in_grams) do
    process_first_fish = eat_fish?(head, threshold_in_grams)
    case process_first_fish.consumed do
      true ->
        [ process_first_fish | process_fishes(tail, head) ]
      false ->
        [ process_first_fish | process_fishes(tail, %{unit: :grams, weight: 0}) ]
    end
  end

  def process_fishes([head | tail], largest_fish_consumed) do
    process_current_fish = eat_fish?(head, largest_fish_consumed)
    case process_current_fish.consumed do
      true ->
        [ process_current_fish | process_fishes(tail, head) ]
      false ->
        [ process_current_fish | process_fishes(tail, largest_fish_consumed) ]
    end
  end

  def process_fishes([], _) do
    []
  end


end
