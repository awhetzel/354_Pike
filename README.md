# 354_Pike
* Authors: Aaron Whetzel, Jacob Doerr

## Description
This repo is for a simple implementation of Mancala in Pike. Initially
it will be a simple single player console game. If time allows, we will
add multiplayer and GUI features. 

## Rules

* The Mancala board is made up of two rows of six holes, or pits, each.

* Four pieces—marbles, chips, or stones—are placed in each of the 12 holes. The color of the pieces is irrelevant.

* Each player has a store (called a Mancala) to the right side of the Mancala board. 

* The game begins with one player picking up all of the pieces in any one of the holes on thier side.

* Moving counter-clockwise, the player deposits one of the stones in each hole until the stones run out.
    
* If you run into your own store, deposit one piece in it. If you run into your opponent's store, skip it.
    
* If the last piece you drop is in your own store, you get a free turn.

* If the last piece you drop is in an empty hole on your side, you capture that piece and any pieces in the hole directly opposite. 
   
* Always place all captured pieces in your store.
    
* The game ends when all six spaces on one side of the Mancala board are empty.
    
* The player who still has pieces on his side of the board when the game ends capture all of those pieces. (Not implemented)
    
* Count all the pieces in each store. The winner is the player with the most pieces.

[Rules taken from this site] (https://www.thespruce.com/how-to-play-mancala-409424)

## Manifest
* README.md - This file

## Testing

## Known Bugs
* Currently no known bugs
