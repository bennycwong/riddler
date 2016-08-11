# Elevator Button Riddle
The elevator button riddle, simulated in elixir.  
Author's note: The purpose of this library is for familiarizing myself with the mix tooling in elixir.

[Click here to see it on Riddler](https://fivethirtyeight.com/features/can-you-solve-this-elevator-button-puzzle/)

In a building’s lobby, some number (N) of people get on an elevator that goes to some number (M) of floors. There may be more people than floors, or more floors than people. Each person is equally likely to choose any floor, independently of one another. When a floor button is pushed, it will light up.

What is the expected number of lit buttons when the elevator begins its ascent?

## Terms:
People: How many people are in the elevator  
Floors: 10  
EV: Expected number of buttons pressed  
Significance: How many tries at each People/Floor combo to determine the EV (Higher is more accurate)  

## To run:
Assuming you have elixir installed [instructions](http://elixir-lang.org/install.html), just run the following bash command:

```bash
$ mix elevator.simluate
```
[![demo](https://cloud.githubusercontent.com/assets/4430436/17579892/af24cf12-5f4e-11e6-9f19-be9357d70f2c.gif)](https://asciinema.org/a/82147?autoplay=1)

## Results
The results are organized in the results directory.  

The file naming scheme is `elevator-{# of people}-{# of floors}-{significance}.csv`

For example [elevator-20-10-1000.csv](./results/elevator-20-10-1000.csv) has the results of up to:  
People `20`  
Floors `10`  
Significance `1000`  
