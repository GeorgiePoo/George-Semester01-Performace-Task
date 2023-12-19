extends Area2D

@onready var b_gmusic = $"../BGmusic"
@onready var enemy_hit = $"../EnemyHit"
@export var Speed = 400
var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	b_gmusic.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2.ZERO 
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * Speed
		
	position += velocity * delta


func _on_body_entered(body):
	hide()
	b_gmusic.stop()
	enemy_hit.play()
