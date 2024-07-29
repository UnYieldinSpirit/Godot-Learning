extends Sprite2D

##variable used to determine the speed of the player-controlled asset
var speed = 400 
var angular_speed = PI

func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

func _on_button_pressed():
	set_process(not is_processing())

func _ready():
	var timer = get_node("Timer") ##timer can be used for skill cooldowns
	timer.timeout.connect(_on_timer_timeout) ##after timer timesout it calls a function
	
func _on_timer_timeout(): ##function called after timeout: invisibility
	visible = not visible
