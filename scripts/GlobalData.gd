extends Node

var plort_count: int
var potion_count: int
var heal_count: int
var player_lives: int

var damageValues: Array

var minX: int
var maxX: int
var minY: int
var maxY: int

func _ready() -> void:
	reset()

# Resets all globally stored data to its predefined default values
func reset() -> void:
	plort_count = 0
	potion_count = 0
	heal_count = 0
	player_lives = 10
	damageValues = [1, 3, 7, 15]
	minX = 400
	maxX = 1200
	minY = 700
	maxY = 800
