extends CharacterBody2D

# estados que o player pode assumir
enum estadosJogador {
	idle,
	andando,
	pulando
}

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
const SPEED = 80.0
const JUMP_VELOCITY = -300.0

var estado: estadosJogador

func _ready() -> void:
	vai_para_Idle()

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	match estado:#verifica estado atual do jogador
		estadosJogador.idle:
			idle_estado()
		estadosJogador.andando:
			andando_estado()
		estadosJogador.pulando:
			pulando_estado()
			
	move_and_slide()
	
	
func vai_para_Idle():
	estado = estadosJogador.idle
	anim.play("Idle")
	
func vai_para_Andar():
	estado = estadosJogador.andando
	anim.play("andar")
	
func vai_para_Pular():
	estado = estadosJogador.pulando
	anim.play("pular")
	velocity.y = JUMP_VELOCITY
	

func idle_estado():
	move()
	if velocity.x != 0:
		vai_para_Andar()
		return
	if Input.is_action_just_pressed("pulo"):
		vai_para_Pular()
		return
		
func andando_estado():
	move()
	if velocity.x == 0:
		vai_para_Idle()
		return
	
	if Input.is_action_just_pressed("pulo"):
		vai_para_Pular()
		return
		
		
func pulando_estado():
	move()
	if is_on_floor():
		if velocity.x == 0:
			vai_para_Idle()
		else:
			vai_para_Andar()
		return
		
	

func move():
	var direction := Input.get_axis("esq", "dir")
	if direction: # direction é -1 com player andando para esquerda e 1 andando pra direita
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if direction < 0:
		anim.flip_h = true #inverte a sprite do plyr na horizontal
	elif direction > 0:
		anim.flip_h = false
		






	
	
	
	
