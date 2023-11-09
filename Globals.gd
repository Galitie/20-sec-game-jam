extends Node

# Change the rate enemies appear
var sec_between_enemies = 1

# enemies and towers are objects, add an object to the arrays below to add more
# enemies have a default health of 3 and a default speed of 150
# they will spawn in order from the start of the array to the end
# currently they just keep looping when they reach the end of the path
var enemy_data = [ 
	{"hp": 3, "speed": 150},
	{"hp": 10, "speed": 250},
	{"hp": 1, "speed": 100},
	{"hp": 5, "speed": 150},
	{"hp": 10, "speed": 250},
	{"hp": 3, "speed": 100},
]

# only 3 towers available for prototype, don't add more but feel free to change the values
# firerate is per second, you can use decimals/floats
# range = 200 is about 1 square around the tower
var tower_data = {
	"TowerType1" : {
		"damage": 1, 
		"firerate": .5, 
		"range": 350},
	"TowerType2" : {
		"damage": 3, 
		"firerate": 1, 
		"range": 200},
	"TowerType3" : {
		"damage": 5, 
		"firerate": 2, 
		"range": 600},
}
