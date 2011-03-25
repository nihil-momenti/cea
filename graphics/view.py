from __future__ import division

from OpenGL.GL import *
from OpenGL.GLU import *
from OpenGL.GLUT import *

class View(object):

  BACKGROUND = (0.95, 0.95, 0.95, 1)

  def __init__(self, player, scene):
    self.scene = scene
    self.player = player
    self.fov = 50
    self.near = 1
    self.far = 10000
    self.aspect = self.width = self.height = 0

    glutInit(sys.argv)
    glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_DEPTH | GLUT_MULTISAMPLE)
    
    glutInitWindowSize(496, 311)
    glutInitWindowPosition(0, 0)
    glutCreateWindow("CEA Lattice Display")

    glutSetKeyRepeat(GLUT_KEY_REPEAT_OFF)
    glutIgnoreKeyRepeat(1)

    glClearColor( *self.BACKGROUND )
    glEnable(GL_DEPTH_TEST)
    glEnable(GL_LIGHTING)
    glEnable(GL_NORMALIZE)
    glEnable(GL_CULL_FACE)
    glLightModelf(GL_LIGHT_MODEL_LOCAL_VIEWER, GL_TRUE)

    self.scene.gl_init()


  def reshape(self, width, height):
    glViewport(0, 0, width, height)
    self.width = width
    self.height = height
    self.aspect = width / height


  def display(self):
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    gluPerspective(self.fov, self.aspect, self.near, self.far)

    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()
    params = []
    params.extend(self.player.position)
    params.extend(self.player.lookat)
    params.extend(self.player.viewup)
    gluLookAt(*params)

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    self.scene.display()
    glutSwapBuffers()
