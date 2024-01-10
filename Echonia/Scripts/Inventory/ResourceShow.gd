extends Button

@export var resource: Item_Resource

func _process(delta: float) -> void:
	text = resource.resource +": " + str(resource.count)
	icon = resource.sprite
