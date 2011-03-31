Enough is ENOUGH! I have had it with these motherf'in' hacks in this motherf'in' assignment!
============================================================================================

Introduction
------------

Okay, calm down.  I'm sorry but all these *hacks* are neccessary, some make
stuff work right in all versions, others fix problems with Windows support.
Just read on for the reasons behind each of these hacks.

`backports.rb`
--------------

This is the file that makes all this work under Ruby 1.8.6.  The main
interpreter used during developement was Rubinius, based around MRI 1.8.7.
Unfortunately the COSC Linux boxes only have MRI 1.8.6 installed so some
missing methods have to be backported.  The simple methods such as `Array#take`
and `Array#drop` were simply created on the spot, the more complex methods such
as `Enumerable#one?` and `Hash.[]` were taken from the Rubinius source code.`
