extends MeshInstance3D

func change_color():
	var material = StandardMaterial3D.new()
	material.albedo_color = Color(0,100,100)
	self.material_override = material

func reset_color():
	self.material_override = null
