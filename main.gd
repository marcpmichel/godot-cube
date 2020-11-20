extends Spatial

# Declare member variables here. Examples:
var cam
var mesh
var light
var angle = 0
var colors = [ "gray", "aliceblue", "antiquewhite", "aqua", "aquamarine", 
	"azure", "beige", "bisque", "black", "blanchedalmond", "blue", 
	"blueviolet", "brown", "burlywood", "cadetblue", "chartreuse", 
	"chocolate", "coral", "cornflower", "cornsilk", "crimson", "cyan", 
	"darkblue", "darkcyan", "darkgoldenrod", "darkgray", "darkgreen", 
	"darkkhaki", "darkmagenta", "darkolivegreen", "darkorange", 
	"darkorchid", "darkred", "darksalmon", "darkseagreen", "darkslateblue", 
	"darkslategray", "darkturquoise", "darkviolet", "deeppink", 
	"deepskyblue", "dimgray", "dodgerblue", "firebrick", "floralwhite", 
	"forestgreen", "fuchsia", "gainsboro", "ghostwhite", "gold", 
	"goldenrod", "green", "greenyellow", "honeydew", "hotpink", 
	"indianred", "indigo", "ivory", "khaki", "lavender", "lavenderblush", 
	"lawngreen", "lemonchiffon", "lightblue", "lightcoral", "lightcyan", 
	"lightgoldenrod", "lightgray", "lightgreen", "lightpink", "lightsalmon", 
	"lightseagreen", "lightskyblue", "lightslategray", "lightsteelblue", 
	"lightyellow", "lime", "limegreen", "linen", "magenta", "maroon", 
	"mediumaquamarine", "mediumblue", "mediumorchid", "mediumpurple", 
	"mediumseagreen", "mediumslateblue", "mediumspringgreen", 
	"mediumturquoise", "mediumvioletred", "midnightblue", "mintcream", 
	"mistyrose", "moccasin", "navajowhite", "navyblue", "oldlace", "olive", 
	"olivedrab", "orange", "orangered", "orchid", "palegoldenrod", "palegreen", 
	"paleturquoise", "palevioletred", "papayawhip", "peachpuff", "peru", 
	"pink", "plum", "powderblue", "purple", "rebeccapurple", "red", 
	"rosybrown", "royalblue", "saddlebrown", "salmon", "sandybrown", 
	"seagreen", "seashell", "sienna", "silver", "skyblue", "slateblue", 
	"slategray", "snow", "springgreen", "steelblue", "tan", "teal", 
	"thistle", "tomato", "transparent", "turquoise", "violet", "webgray", 
	"webgreen", "webmaroon", "webpurple", "wheat", "white", "whitesmoke", 
	"yellow", "yellowgreen" ]


# Called when the node enters the scene tree for the first time.
func _ready():
	print("hello")
	cam = Camera.new()
	self.add_child(cam)
	#mesh = createCube()
	#self.add_child(mesh)
	#cam.translate(Vector3(-3,1.5,-3))
	createScene()
	cam.translate(Vector3(-20,1.5,-20))
	cam.look_at(Vector3(0,0,0), Vector3.UP)
	light = OmniLight.new()
	self.add_child(light)
	light.light_energy = 1
	light.omni_range = 20
	light.translate(Vector3(-5,5,5))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#mesh.rotate(Vector3(0, 1, 0), delta)
	angle += delta / 1.0
	var pos = Vector3(cos(angle)*20, 1.5, sin(angle)*20)
	cam.look_at_from_position(pos, Vector3(0,0,0), Vector3.UP)

func createScene():
	for i in range(0,30):
		mesh = createCube()
		self.add_child(mesh)

func createCube():
	var inst = MeshInstance.new()
	inst.name = "cube"
	inst.set_mesh(CubeMesh.new())
	# mesh.scale_object_local(Vector3(3,3,3))
	var mat = SpatialMaterial.new()
	# mat.set_diffuse_mode(SpatialMaterial.DIFFUSE_LAMBERT)
	# mat.set_albedo(Color("#FF0000"))
	var colname = colors[randi() % colors.size()]
	mat.set_albedo(ColorN(colname, 1))
	inst.set_surface_material(0, mat)
	#inst.rotate_x(randf() * 6.28)
	#inst.rotate_y(randf() * 6.28)
	#inst.rotate_z(randf() * 6.28)
	#inst.translate(Vector3(randf()*10 - 5, randf()*10 - 5, randf()*10 - 5))
	inst.translate(Vector3((randi()%11-5)*2, (randi()%11-5)*2, (randi()%11-5)*2))
	return inst

