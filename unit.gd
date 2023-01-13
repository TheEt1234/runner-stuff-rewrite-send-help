extends KinematicBody2D
# literally just variables and some basic shit
class_name unit
export var is_immortal:=false #really not sure why would you want this
export var max_health:=0
export var damage:=0
export var canBePushed:=false
export var pushMultiplier:=1.0
var current_health:=99
var weapons:=[] 

func apply_weapons():
	for i in weapons.size():
		$Weapons.add_child(weapons[i])
func _ready() -> void:
	current_health=max_health
func damage(enemy_damage):
	if !is_immortal:
		current_health=current_health-enemy_damage
func heal(ammount):
	if !is_immortal:
		current_health=ammount+max_health

func drop():
	pass

func die(isPlayer):
	if isPlayer:
		Api.player=null
	get_node("Collider").disabled=true
	queue_free()
