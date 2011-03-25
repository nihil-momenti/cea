from __future__ import division

from view import View
from world import World
from player import Player
from controller import Controller

try:
  import psyco
  psyco.full()
  print "Psyco Running"
except ImportError:
  print "Psyco not available"

world = World()
player = Player(world.start_point)
view = View(player, world)
controller = Controller(player, world, view)
controller.run()
