# Balatro, but as a trading card game!

A new multiplayer mod, fully compatible with the official Multiplayer Mod and Server!

## How does it work?

Build your deck or use a prebuilt deck.  Join a TCG specific lobby and fight your friends!  Buy everything from your hand, and wittle your opponent's money down until they bankrupt.

## Does this use a custom server?

Not anymore!  Thanks to Virtualized for helping me get their server up to date and supporting this mod.

## How does damage even calculate?

So... there's an short and long answer.

### Short answer
Basically the more digits in your final score for the round, the higher your attack.

### Long answer
The scoring is slightly complicated.

Your final attack is the square of the log base 10 of your final score.  Take how many extra digits your number has, Square that, and add a bit more depending on close it is to the next digit threashold.

Example:
    3.42e11 => 11.54 => 133 points of damage

### That's confusing...

Okay, here's a simple table to help

| Final Score | Damage output |
| --- | --- |
| 10 | 1 |
| 100 | 4 |
| 1,000 | 9 |
| 10,000 | 16 |
| 100,000 | 25 |
| 11,780,000 | 50 |
| 457,500,000 | 75 |
| 10,000,000,000 | 100 |