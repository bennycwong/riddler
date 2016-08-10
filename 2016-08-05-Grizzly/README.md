# Should The Grizzly Bear Eat The Salmon?
https://fivethirtyeight.com/features/should-the-grizzly-bear-eat-the-salmon/

A grizzly bear stands in the shallows of a river during salmon spawning season. Precisely once every hour, a fish swims within its reach. The bear can either catch the fish and eat it, or let it swim past to safety. This grizzly is, as many grizzlies are, persnickety. It’ll only eat fish that are at least as big as every fish it ate before.

Each fish weighs some amount, randomly and uniformly distributed between 0 and 1 kilogram. (Each fish’s weight is independent of the others, and the skilled bear can tell how much each weighs just by looking at it.) The bear wants to maximize its intake of salmon, as measured in kilograms. Suppose the bear’s fishing expedition is two hours long. Under what circumstances should it eat the first fish within its reach? What if the expedition is three hours long?


## Prerequisites
Install Elixir:
http://elixir-lang.org/install.html

## Assumptions
Version 1 of this simulation assumes that grams are the smallest unit of weight. Thus, there are 1000 possible sizes, from 1 gram to 1000 grams.

In the future, There might be macros that can handle different units as well.

__threshold__ refers to the minimum weight of the first fish before the bear eats it.

## Statistics and Other Notes
The simulation calculates the expected value the threshold using brute force.


The higher the EV Significance, the longer this will take to run. For initial tests, start with a significance of 10.  
A more realistic test will probably require a significance of > 100,000.

## Modify the variables

```elixir
#Hours: How long was the expedition (How many fishes did the Grizzly see?)
hours = 2

#How many tries did the simulation run at each threshold
significance = 1_000

#What's the range you want to test?
#Expects a list of integers.
threshold_range = 1..1_000
#You can also write threshold_range = [1, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]
```


## To Run Simulation
```bash
$ elixir simulation.exs
```
The results will be outputted to results/grams/results.csv in a new row.


## How to view results:
Click [here](./results/grams/results.csv) to see the CSV of sample runs  

##### Legend:  
Winner: At what threshold did the Grizzly Bear eat the most fish in grams?  
Max: What was max amount of fish the Grizzly ate in the simulation?  
Hours: How long was the expedition (How many fishes did the Grizzly see?)  
EV significance: How many tries did the simulation run at each threshold
Range: What was the thresholds tested?


## Pre Generated Expected Values
Since generating the EV is the bulk of the wor, I've pre generated a whole bunch of them. Feel free to use that set for any analysis.  
The file scheme is `results/grams/#{hours}/ev-#{hours}-#{significance}.csv`.  
For example, `ev-2-10000.csv` means it was ran with 10000 tries to get the expected value at that threshold, with 2 hours
Click [here](./results/grams/2-hours/ev-2-10000.csv) to see the CSV of sample runs  

## Generate your own EV.csv for further Experimentation:
To generate your own EV.csv, run the following command. You will be prompted to input two values in Integer form.

[![demo](./cli.gif)](https://asciinema.org/a/82147?autoplay=1)
```bash
$ elixir generate_expected_values.exs
Expedition length in hours (how many fishes will you see)? [Please Enter Integer]
2
How many times to run this to generate an Expected Value? [Please Enter Integer]
200
```
