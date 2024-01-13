extends CanvasLayer

var v = false
func _ready() -> void:
	Engine.max_fps = 60
func _process(delta: float) -> void:
	$FpsText.text = "FPS:  " + str(Engine.get_frames_per_second()) + "/60"
	$TimeScale.text = "TIME SCALE: " + str(Engine.time_scale)
	$ArchitetureName.text = "ARCHITECTURE NAME: " + Engine.get_architecture_name()
	$MainLoop.text = "Main LOOP: " + str(Engine.get_main_loop())
	$PhysicsPhrames.text = "Physics Phrames: " + str(Engine.get_physics_frames())
	$PhysicsInterpolation.text = "Physics Interpolation: " + str(Engine.get_physics_interpolation_fraction())
	$ProcceseFrames.text = "Procces Frames: " + str(Engine.get_process_frames())
	$VersionInfo.text = "Version: " + str(Engine.get_version_info())
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('DebugMode'):
		v = !v
		visible = !v
