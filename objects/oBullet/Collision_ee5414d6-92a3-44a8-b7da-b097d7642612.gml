with(other) {
hp += -1;
flash_delay = 3;
hit_from = other.direction;
is_hit = true;

}

with(other) effect_create_above(0, other.x, other.y, 0, col & $ffffff);

instance_destroy();