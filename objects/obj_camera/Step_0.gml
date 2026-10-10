var _prota = instance_find(obj_prota, 0);
var _uber  = instance_find(obj_uber, 0);

if (instance_exists(_prota) && _prota.visible) {
    follow = _prota;
} else if (instance_exists(_uber)) {
    follow = _uber;
} else if (instance_exists(_prota)) {
    follow = _prota; 
}

if (instance_exists(follow)) {
    xto = follow.x;
    yto = follow.y;
}


x += (xto - x)/25;
y += (yto - y)/25;

camera_set_view_pos(
    view_camera[0],
    clamp(x - (camWidth * 0.5), 0, max(0, room_width - camWidth)),
    clamp(y - (camHeight * 0.5), 0, max(0, room_height - camHeight))
);