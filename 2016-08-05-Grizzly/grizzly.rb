require 'pry'
require 'pp'

# hours = 2

upper_weight = 1000.0

iterations = 1000
thresholds = *(0..upper_weight)

weights_for_threshold = {}

def single_value_for_threshold(threshold, upper_weight)
  total_fish_eaten = 0
  last_fish_eaten = 0

  # fish 1
  fish_1 = rand(0..upper_weight)
  if fish_1 >= threshold
    last_fish_eaten = fish_1
    total_fish_eaten += fish_1
  end

  # fish 2
  fish_2 = rand(0..upper_weight)
  if fish_2 >= threshold && fish_2 >= last_fish_eaten
    last_fish_eaten = fish_2
    total_fish_eaten += fish_2
  end

  total_fish_eaten
end

def expected_value_for_threshold(threshold, iterations, upper_weight)
  total_fish_weight = 0

  (0..iterations).each do |i|
    total_fish_weight += single_value_for_threshold(threshold, upper_weight)
  end

  total_fish_weight/iterations
end

thresholds.each do |threshold|
  weights_for_threshold[threshold] = expected_value_for_threshold(threshold, iterations, upper_weight)
end

# find max
max = weights_for_threshold.max_by{|k,v| v}
pp max
pp max.first / upper_weight


# find top 5
pp Hash[weights_for_threshold.sort_by{|k,v| -v}.first(5)]

pp weights_for_threshold[333]
