extends unit

#truly basic enemy
export var velocity=Vector2.ZERO
export var bounceFromGround=false
export (String, FILE, "*.png") var sprite:="res://basicEnemySprite.png"

func _ready()->void:
	$BasicEnemySprite.texture=load(sprite)
	set_physics_process(false)

func _physics_process(_delta: float) -> void:
	if current_health<=0:
		die(false)
	if is_on_wall():
		velocity.x *=-1.0
	elif is_on_ceiling():
		velocity.y *=-1.0
	if bounceFromGround and is_on_floor():
		velocity.y *=-1
	var _shut_the_fuck_up=move_and_slide(velocity,Vector2.UP)


func _on_stomp_body_entered(body: Node) -> void:
	if body.global_position.y<$"S T O M P".global_position.y and body==Api.player:
		damage(body.damage)
