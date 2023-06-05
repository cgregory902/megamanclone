/// @description Bullet slashed by player
// When enemy bullet is slashed, fling it back at them (destroy, then create new player bullet moving opposite direction)

instance_destroy(self);
instance_create_layer(self.x, self.y, "Instances", oBulletSlash);
