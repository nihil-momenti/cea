from __future__ import division

from OpenGL.GL import *

from geom3 import Point3

class FlatPlane(object):
  def __init__(self):
    self.size = 50

  def gl_init(self):
    self.listID = glGenLists(1)
    self.generate_list()

  def generate_list(self):
    glNewList(self.listID, GL_COMPILE_AND_EXECUTE); glBegin(GL_TRIANGLES)

    for i in range(self.size):
      for j in range(self.size):
        glVertex(i, j, 0)
        glVertex(i+1, j, 0)
        glVertex(i, j+1, 0)

        glVertex(i+1, j, 0)
        glVertex(i+1, j+1, 0)
        glVertex(i, j+1, 0)

  def display(self):
    glCallList(self.listID)

class World(object):
  def __init__(self):
    self.contents = set()
    self.contents.add(FlatPlane())
    self.start_point = Point3(0, 0, 0)


  def gl_init(self):
    [thing.gl_init() for thing in self.contents]


  def display(self):
    [thing.display() for thing in self.contents]


  def add(self, thing):
    self.contents.add(thing)
