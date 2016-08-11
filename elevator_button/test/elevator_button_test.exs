defmodule ElevatorButtonTest do
  use ExUnit.Case
  doctest ElevatorButton

  test "How many people generates a list length of people count" do
    assert ElevatorButton.make_list_of_people(10) |> length == 10
  end

  test "Randomly picks a floor returns a number" do
    assert ElevatorButton.randomly_pick_a_floor(10) |> is_integer == true
  end

  test "Each person picks a floor returns list of numbers" do
    assert ElevatorButton.each_person_picks_a_floor(1..100, 10) |> is_list == true
  end

  test "Each person picks a floor returns list of numbers no greater than upper bound" do
    assert ElevatorButton.each_person_picks_a_floor(1..10000, 10) |> Enum.max <= 10
  end

  test "Each person picks a floor returns list of 100 numbers" do
    assert ElevatorButton.each_person_picks_a_floor(1..100, 10) |> Enum.count == 100
  end

  test "Simulate returns an integer representing of lights pressed in a given scenario" do
    assert ElevatorButton.simluate(10, 3) |> is_integer == true
  end


end
