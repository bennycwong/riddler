# ElevatorButton

The elevator button riddle, simulated in elixir:

[Riddler link](https://fivethirtyeight.com/features/can-you-solve-this-elevator-button-puzzle/)

In a building’s lobby, some number (N) of people get on an elevator that goes to some number (M) of floors. There may be more people than floors, or more floors than people. Each person is equally likely to choose any floor, independently of one another. When a floor button is pushed, it will light up.

What is the expected number of lit buttons when the elevator begins its ascent?

## Terms:
People: How many people are in the elevator  
Floors: 10  
EV: Expected number of buttons pressed  
Significance: How many tries at each People/Floor combo to determine the EV (Higher is more accurate)  

## To run:

```bash
$ mix elevator.simluate
Run the simluation for up to how many people? [Please Enter Integer]
10
Run the simluation for up to how many floors? [Please Enter Integer]
10
How many times to run the simluation? Higher means more accurate expected value, but slower? [Please Enter Integer]
10
Running Simluation...
```
## Results
The results are organized in the results directory.  

The file naming scheme is `elevator-{# of people}-{# of floors}-{significance}.csv`

For example `[elevator-20-10-1000.csv](./results/elevator-20-10-1000.csv)` has the results of up to:  
People `20`  
Floors `10`  
Significance `1000`  

Sample result set:
```csv
EV Chart,1 Floors,2 Floors,3 Floors,4 Floors,5 Floors,6 Floors,7 Floors,8 Floors,9 Floors,10 Floors
1 People,1,1,1,1,1,1,1,1,1,1
2 People,1,1,1,1,1,1,1,1,1,1
3 People,1,1,2,2,2,2,2,2,2,3
4 People,1,2,2,2,3,3,3,3,3,3
5 People,1,2,2,3,3,3,3,4,4,4
6 People,1,2,2,3,3,3,4,4,4,4
7 People,1,2,2,3,3,4,4,4,5,5
8 People,1,2,2,3,4,4,5,5,5,5
9 People,1,2,3,3,4,4,5,5,5,6
10 People,1,2,3,3,4,5,5,5,6,6
```
