#!/usr/bin/env ruby
require_relative '../lib/object_tictactoe'


puts `say Welcome to Tic Tac Toe!`
puts "Welcome to Tic Tac Toe!"

game = TicTacToe.new
game.display_board
game.play
