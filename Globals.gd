extends Node

var sec_between_enemies = 1
# enemies and towers are objects, add an object to the arrays below to add more
# enemies have a default health of 3 and a default speed of 150
# they will spawn in order from the start of the array to the end
var enemy_data = [ 
	{"hp": 3, "speed": 150},
	{"hp": 3, "speed": 250},
	{"hp": 3, "speed": 100},
]

# only 3 towers available for prototype, don't add more but feel free to change the values
var tower_data = {
	"TowerType1" : {
		"damage": 1, 
		"firerate": 300, 
		"range": 350},
	"TowerType2" : {
		"damage": 1, 
		"firerate": 300, 
		"range": 200},
	"TowerType3" : {
		"damage": 1, 
		"firerate": 300, 
		"range": 600},
}
