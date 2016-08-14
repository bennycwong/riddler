defmodule ElevatorButton do

  def simulate(number_of_people, number_of_floors) do
    number_of_people
    |> make_list_of_people
    |> each_person_picks_a_floor(number_of_floors)
    |> unique_floors_pressed
    |> count_floor_buttons_pressed
  end

  def make_list_of_people(people_count) do
    1..people_count |> Enum.to_list
  end

  def each_person_picks_a_floor(list, number_of_floors) do
    list |> Enum.map(fn _ -> randomly_pick_a_floor(number_of_floors) end)
  end

  def randomly_pick_a_floor(number_of_floors) do
    1..number_of_floors |> Enum.random
  end



  defp unique_floors_pressed(list_of_floors_pressed) do
    list_of_floors_pressed |> Enum.uniq
  end

  defp count_floor_buttons_pressed(unique_floors_pressed) do
    unique_floors_pressed |> Enum.count
  end
end
