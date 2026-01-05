extends Label

var score = 0

func _ready():
	var zombies = get_tree().get_nodes_in_group("zombies")
	for zombie in zombies:
		print("connected")
		zombie.hit_by_bullet.connect(_on_enemy_hit_by_bullet)

func _on_enemy_hit_by_bullet() -> void:
	score += 1
	text = str(score)
