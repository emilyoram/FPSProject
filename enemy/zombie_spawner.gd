extends Node3D

const ZOMBIES_BEFORE_SPEED_INCREASE = 8

@onready var zombie_scene = preload("res://enemy/zombie.tscn")
@onready var spawn_timer = $SpawnTimer

var zombies = 0

signal zombie_spawned

func spawn_zombie():
	var zombie = zombie_scene.instantiate()
	var random_x = randf_range(global_position.x - 10, global_position.x + 10)
	var random_z = randf_range(global_position.z - 10, global_position.z + 10)
	add_child(zombie)
	zombie.global_position.x = random_x
	zombie.global_position.z = random_z
	zombie_spawned.emit()
	zombies += 1
	if zombies >= ZOMBIES_BEFORE_SPEED_INCREASE:
		print("speed increased")
		zombies = 0
		spawn_timer.wait_time = max(spawn_timer.wait_time - 0.5, 1.55)
		print(str(spawn_timer.wait_time))
	
func _on_spawn_timer_timeout() -> void:
	spawn_zombie()
