extends Node2D

export (PackedScene) var Item

export var max_item_num = 5
var item_count = 0

func _ready():
	randomize()

	_set_camera()

	$ItemSpawnTimer.start()

	$Player.start($StartPosition.position)

func _on_ItemSpawnTimer_timeout():
	_spown_item()

###

func _set_camera():
	var camera_limit = $Map/Polygon2D.get_rect()
	$Player/Camera2D.limit_left = camera_limit.position.x
	$Player/Camera2D.limit_top = camera_limit.position.y
	$Player/Camera2D.limit_right = camera_limit.position.x + camera_limit.size.x
	$Player/Camera2D.limit_bottom = camera_limit.position.y + camera_limit.size.y

func _spown_item():
	$ItemPath/ItemSpawnLocation.set_offset(randi())

	var item = Item.instance()
	add_child(item)

	item.position = $ItemPath.position + $ItemPath/ItemSpawnLocation.position

	item_count += 1

	if item_count >= max_item_num:
		$ItemSpawnTimer.stop()
