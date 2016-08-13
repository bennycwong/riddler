defmodule GrizzlySimulationTest do
  use ExUnit.Case
  doctest GrizzlySimulation

  test "avg_number_from_list returns a number" do
    assert GrizzlySimulation.avg_number_from_list([1,2,3,4,5]) |> is_integer == true
  end

  test "avg_number_from_list returns an average of the sum of the list" do
    assert GrizzlySimulation.avg_number_from_list([10,20,30,50,50]) == 32
  end

  test "expected_value returns a number" do
    assert GrizzlySimulation.expected_value(5, 5, 5) |> is_integer == true
  end

end
