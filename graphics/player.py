from __future__ import division

import time
from math import sqrt, atan2, cos, sin, pi, acos
from geom3 import Vector3, unit

from OpenGL.GL import *
from OpenGL.GLU import *
from OpenGL.GLUT import *

class Player(object):
  def __init__(self, start_point):
    self.position = start_point + Vector3(0, 0, 0)
    self.lookat = start_point + Vector3(1, 0, 0)
    self.viewup = Vector3(0, 1, 0)
    self.sensitivity = 10
    self.speed = 100
    self.moving = set()
    self.in_motion = False

  def move(self, direction):
    if direction in self.moving:
      return

    if direction in ['LEFT', 'RIGHT', 'FORWARD', 'BACK', 'UP', 'DOWN']:
      self.moving.add(direction)
      if not self.in_motion:
        self.in_motion = True
        self.update_time = time.time()
        self.update()

  def stop(self, direction):
    if direction in self.moving:
      self.moving.remove(direction)

  def update(self, value=0):
    if len(self.moving) > 0:
      now = time.time()
      for direction in self.moving:
        if   direction == 'FORWARD': self.forward( self.speed * (now - self.update_time))
        elif direction == 'BACK'   : self.forward(-self.speed * (now - self.update_time))
        elif direction == 'RIGHT': self.right( self.speed * (now - self.update_time))
        elif direction == 'LEFT' : self.right(-self.speed * (now - self.update_time))
        elif direction == 'UP'  : self.up( self.speed * (now - self.update_time))
        elif direction == 'DOWN': self.up(-self.speed * (now - self.update_time))
      self.update_time = now
      glutTimerFunc(10, self.update, 0)
    else:
      self.in_motion = False

  def facing(self):
    return unit(self.lookat - self.position)

  def forward(self, amount):
    movement = amount * unit(self.facing())
    self.position += movement
    self.lookat += movement
    glutPostRedisplay()

  def right(self, amount):
    movement = amount * unit(self.facing().cross(self.viewup))
    self.position += movement
    self.lookat += movement
    glutPostRedisplay()

  def up(self, amount):
    movement = amount * self.viewup
    self.position += movement
    self.lookat += movement
    glutPostRedisplay()

  def turn(self, rotation):
    (x, y, z) = self.lookat - self.position
    r = sqrt(x*x + y*y + z*z)
    theta = max(0.01, min(pi - 0.01, acos(y / r) + self.sensitivity * rotation[1]))
    phi = atan2(z, x) + self.sensitivity * rotation[0]
    (x, y, z) = (r * sin(theta) * cos(phi), r * cos(theta), r * sin(theta) * sin(phi))
    self.lookat = self.position + Vector3(x, y, z)
    glutPostRedisplay()
