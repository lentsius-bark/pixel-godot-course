class_name UnitStats extends Resource

@export_group("words")
@export var unit_name : String = "John"
@export_multiline var unit_description : String = "A good man"

@export_group("numbers")
@export var health : int = 100
@export_range(1.0, 34) var walk_speed : float = 8.0
