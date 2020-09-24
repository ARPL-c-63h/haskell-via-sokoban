✍️ Exericses {.exercises}
=========

You are free to use the [code from above](https://code.world/haskell#PTU3hQlDx2i-jo0IFldfY8Q) and from your own
solutions to the first set of exercises. Some of the exercises below reference types and
functions from there. In particular, if you have nicely drawn tiles, you should
use them instead of my ugly ones.

You learned about local definitions and lambda expressions. Use them when
appropriate!

The small guy (or girl) moves
-----------------------------

We hope to have a complete game by next week, so let us work towards that.

Create a value `player :: Picture` that draws your figure.

Create a value `exercise1 :: IO ()` that calls `interactionOf` with suitable
arguments that:

 * the player is drawn on top of the maze,
 * it starts in a position where there is ground (you can hard-code that position),
 * the cursor keys move the figure around (while the maze stays in a fixed position),
 * the player moves only on tiles of type `Ground` and `Storage`. Trying to move it
   into any other position will simply leave it in place.

It might yield nicer code to change the type of `maze` to `Coord -> Tile`. If
you find that, do not hesitate to make that change.

<iframe width="400" height="400" src="https://code.world/run.html?mode=haskell&dhash=DCcnNyZpZZPSVFgqH3WwY3w"></iframe>


Look the right way!
-------------------

This is an extension of exercise 1. We want to figure to look the way it is
going. So write a function `player2 :: Direction -> Picture` that draws the
figure in four variants.

Then extend the code from exercise1 so that after the player has tried to move
in some direction, it looks that way. If you can re-use functions and types
from `exercise1`, do so, but if you have to change them, rename them, e.g. by
appending a `2` to the name.

Hint: Think about types first (e.g of your state), and then about the implementation.

The resulting program should be called `exercise2`.

<iframe width="400" height="400" src="https://code.world/run.html?mode=haskell&dhash=Dal2TK1RkY3oFhVAlSz1YAw"></iframe>

Reset!
------

It would be nice to be able to start a game from the beginning. This is
generally useful functionality, no matter what the game, so let us implement it
generally.

You will write a function
```haskell
resetableInteractionOf ::
    world ->
    (Double -> world -> world) ->
    (Event -> world -> world) ->
    (world -> Picture) ->
    IO ()
```
which has the same type as `interactionOf`.

This function will behave almost the same as `interactionOf` (which it
internally uses, of course), but when `Esc` is pressed, this event is not
passed on, but rather the state of the program is reset to the given initial state.

Style hint: An idiomatic definition of `resetableInteractionOf` does not require any other top-level definitions, but likely local functions and/or lambda expressions.

Let `exercise3` be like `exercise2`, but using `resetableInteractionOf` instead
of `interactionOf`.

<iframe width="400" height="400" src="https://code.world/run.html?mode=haskell&dhash=D7Y0vPUj4D2tE2iKoYnvZrg"></iframe>

New levels
----------

Create a new maze. It should

 * fit within the screen (i.e. use coordinates from -10 to 10),
 * it should be connected (i.e. starting on a ground tile, and disregarding boxes, the player should be able to reach all ground tiles),
 * it should be closed (i.e. the player should not be able to reach blank tiles), and
 * it should be solvable (recollect [the rules](https://en.wikipedia.org/wiki/Sokoban#Rules) if necessary).

Use this maze in your exercises above, so that the TA does not get bored while grading.

Also, we will be collecting these mazes and provide them to you so that you can
build a sokoban game with different levels next week.

