extends unit

#could somebody bother fixing the player's lighting, any help would be grately appriciated
export var gravity: = 600
export var speed: = 200
export var jumpForce: = 500
export var stompImpulse=1000


var velocity: = Vector2()
var up=Vector2.UP
var can_move=true
onready var camera:=$Camera2D

func _ready() -> void:
	Api.player=self
func _physics_process(delta:float)->void:
	if gravity>0:
		up=Vector2.UP
	else:
		up=Vector2.DOWN
	if global_position.y>10000 or global_position.y<-10000 or current_health<=0:
		die(true)
	
	velocity.y += delta*gravity
	if can_move:
		if Input.is_action_pressed("ui_left"):
			velocity.x = -speed
		elif Input.is_action_pressed("ui_right"):
			velocity.x = speed
		else:
			velocity.x=0
		if Input.is_action_pressed("ui_up") and is_on_floor():
			velocity.y = -jumpForce
		 
		velocity = move_and_slide(velocity, up)


func _on_EnemyDetector_area_entered(_area: Area2D) -> void:
	velocity.y=-stompImpulse


func _on_EnemyDetector_body_entered(body: Node) -> void:
	current_health-=body.damage
