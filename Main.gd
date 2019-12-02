extends Node

export (PackedScene) var Item

export var max_item_num = 5
var item_count = 0

func _ready():
	# randomize()

	$ItemSpawnTimer.start()

	$Player.start($StartPosition.position)

func _on_ItemSpawnTimer_timeout():
	_spown_item()

func _spown_item():
	$ItemPath/ItemSpawnLocation.set_offset(randi())

	var item = Item.instance()
	add_child(item)

	# print($ItemPath/ItemSpawnLocation.position)
	item.position = $ItemPath.position + $ItemPath/ItemSpawnLocation.position

	item_count += 1

	if item_count >= max_item_num:
		$ItemSpawnTimer.stop()
