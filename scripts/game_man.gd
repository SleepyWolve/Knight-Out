extends Node

var score = 0
var highscore = 0

@onready var top_score_points: Label = $TopScorePoints
@onready var score_points: Label = $ScorePoints

# Called when the node enters the scene tree for the first time.
func add_point(point: int):
	score += point
	print(score)
	highscore = top_score_points.text
	if score > int(highscore):
		top_score_points.text = str(score)
	score_points.text = str(score)
