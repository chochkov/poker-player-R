#!/bin/bash

echo "\n"
curl -X POST 127.0.0.1:8090/custom/lean -d 'action=version'

echo "\n"
curl -X POST 127.0.0.1:8090/custom/lean -d 'action=check'

echo "\n"
curl -X POST 127.0.0.1:8090/custom/lean -d 'action=bet_request&game_state={
  "players":[
    {
      "name":"Player 1",
      "stack":1000,
      "status":"active",
      "bet":0,
      "hole_cards":[],
      "version":"Version name 1",
      "id":0
    },
    {
      "name":"Player 2",
      "stack":1000,
      "status":"active",
      "bet":0,
      "hole_cards":[],
      "version":"Version name 2",
      "id":1
    }
  ],
  "small_blind":10,
  "orbits":0,
  "dealer":0,
  "community_cards":[],
  "current_buy_in":0,
  "pot":0
}'

echo "\n"
curl -X POST 127.0.0.1:8090/custom/lean -d 'action=showdown&game_state={
  "players":[
    {
      "name":"Player 1",
      "stack":1000,
      "status":"active",
      "bet":0,
      "hole_cards":[],
      "version":"Version name 1",
      "id":0
    },
    {
      "name":"Player 2",
      "stack":1000,
      "status":"active",
      "bet":0,
      "hole_cards":[],
      "version":"Version name 2",
      "id":1
    }
  ],
  "small_blind":10,
  "orbits":0,
  "dealer":0,
  "community_cards":[],
  "current_buy_in":0,
  "pot":0
}'
