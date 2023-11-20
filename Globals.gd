extends Node

# Change the rate enemies appear
var sec_between_enemies = .50

# enemies and towers are objects, add an object to the arrays below to add more
# enemies have a default health of 3 and a default speed of 150
# they will spawn in order from the start of the array to the end
# currently they just keep looping when they reach the end of the path
var enemy_data = [ 
	{"hp": 20, "speed": 200, "boss": 0},
	{"hp": 20, "speed": 200, "boss": 0},
	{"hp": 20, "speed": 200, "boss": 0},
	{"hp": 20, "speed": 250, "boss": 0},
	{"hp": 20, "speed": 300, "boss": 0},
	{"hp": 20, "speed": 600, "boss": 0},
	{"hp": 20, "speed": 300, "boss": 0},
	{"hp": 20, "speed": 300, "boss": 0},
	{"hp": 20, "speed": 300, "boss": 0},
	{"hp": 40, "speed": 300, "boss": 1},
	{"hp": 20, "speed": 500, "boss": 0},
	{"hp": 20, "speed": 500, "boss": 0},
	{"hp": 20, "speed": 500, "boss": 0},
	{"hp": 20, "speed": 600, "boss": 0},
	{"hp": 20, "speed": 400, "boss": 0},
	{"hp": 40, "speed": 500, "boss": 1},
	{"hp": 40, "speed": 500, "boss": 1},
	{"hp": 40, "speed": 525, "boss": 1},
]

# only 3 towers available for prototype, don't add more but feel free to change the values
# firerate is per second, you can use decimals/floats
# range = 200 is about 1 square around the tower
var tower_data = {
	"TowerType1" : {
		"damage": 2, 
		"firerate": 0.15, 
		"range": 400},
	"TowerType2" : {
		"damage": 3, 
		"firerate": 1, 
		"range": 200},
	"TowerType3" : {
		"damage": 5, 
		"firerate": 2, 
		"range": 600},
}
