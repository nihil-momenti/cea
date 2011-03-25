from __future__ import division

from OpenGL.GL import *
from OpenGL.GLU import *
from OpenGL.GLUT import *

class Controller(object):
  def __init__(self, player, scene, view):
    self.scene = scene
    self.view = view
    self.player = player
    self.mousePos = (0, 0)
    self.leftButtonState = GLUT_UP

    glutDisplayFunc(self.view.display)
    glutReshapeFunc(self.view.reshape)
    glutMouseFunc(self.mouseButtonFunc)
    glutMotionFunc(self.mouseMotionFunc)
    glutKeyboardFunc(self.keyboardFunc)
    glutKeyboardUpFunc(self.keyboardUpFunc)

  def mouseButtonFunc(self, button, state, x, y):
    if button == GLUT_LEFT_BUTTON:
      self.mousePos = (x, y)
      self.leftButtonState = state
      if state == GLUT_DOWN:
        self.mouseInitialPos = (x, y)
        glutSetCursor(GLUT_CURSOR_NONE)
      else:
        glutWarpPointer(*self.mouseInitialPos)
        glutSetCursor(GLUT_CURSOR_INHERIT)

  def mouseMotionFunc(self, x, y):
    if self.leftButtonState == GLUT_DOWN:
      rotation = [(x - self.mousePos[0]) / self.view.width,
                  (y - self.mousePos[1]) / self.view.width]
      self.player.turn(rotation)
      if x < 0:
        x = self.view.width
        glutWarpPointer(x, y)
      elif x > self.view.width:
        x = 0
        glutWarpPointer(x, y)

      if y < 0:
        y = self.view.height
        glutWarpPointer(x, y)
      elif y > self.view.height:
        y = 0
        glutWarpPointer(x, y)
      self.mousePos = (x, y)
      glutPostRedisplay()

  KEY_MAP = {
      'a': 'LEFT',
      'A': 'LEFT',
      'w': 'FORWARD',
      'W': 'FORWARD',
      's': 'BACK',
      'S': 'BACK',
      'd': 'RIGHT',
      'D': 'RIGHT',
      ' ': 'UP',
      'z': 'DOWN',
      'Z': 'DOWN'
  }

  def keyboardFunc(self, key, x, y):
    if key in self.KEY_MAP:
      self.player.move(self.KEY_MAP[key])
    elif key in ['q', 'Q']:
      glutSetKeyRepeat(GLUT_KEY_REPEAT_ON)
      exit()

  def keyboardUpFunc(self, key, x, y):
    if key in self.KEY_MAP:
      self.player.stop(self.KEY_MAP[key])

  def run(self):
    glutMainLoop()
