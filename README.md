PolyGTK
=======

This package contains GTK+2.0 bindings for Poly/ML. It depends on isaplib, so as a result, is written in the somewhat idiosyncratic style of Isebelle-ish ML.


Building and Running
--------------------

To build, you will need a recent version of Poly/ML (tested with 5.4.2, SVN 1541), and [rake](http://rake.rubyforge.org/). You should also have a sensible GTK+ setup. Namely, `pkg-config` should be your `$PATH` and it should return appropriate headers and libs for `gtk+-2.0`.

Then, clone the latest version of [isaplib](https://github.com/iislucas/isaplib):

    git clone git://github.com/iislucas/isaplib.git

Clone PolyGTK, and build by running `rake`. The first time you compile, it will prompt you for the location of isaplib. If this changes, you can reset it by running `rake config`.

There are a handful of examples included. Run them using:

    rake run example=XXX

Use `rake run` without any arguments to see the examples available.

