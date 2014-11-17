#!/usr/bin/Rscript

library(methods)
library(Rook)
library(yaml)
library(rjson)

source('player.R', local=TRUE)

app <- function(env) {
  request    <- Rook::Request$new(env)
  response   <- Rook::Response$new()

  action     <- request$POST()[['action']]
  game_state <- request$POST()[['game_state']]
  if (! is.null(game_state)) { game_state <- fromJSON(game_state) }

  if (is.null(action)) { response$write('action param must be provided') }
  else if (action == 'version') { response$write(version()) }
  else if (action == 'bet_request') { response$write(bet_request(game_state))}
  else if (action == 'showdown') { response$write(showdown(game_state))}
  else { response$write('OK') }

  response$finish()
}

config = yaml.load_file('config.yml')

server <- Rhttpd$new()
server$add(name='lean', app=app)
server$start(port=config$port)

while (TRUE) Sys.sleep(24*60*60)
