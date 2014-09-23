# Overwrite these functions with your custom bot logic to get into the game.

version     <- function() { "Default R folding player" }
bet_request <- function(game_state) { 0 }
showdown    <- function(game_state) {}
