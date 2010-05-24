SlideRB
=======

SlideRB is the product of about an hour of work on a lazy Sunday afternoon. It's nothing too glorious, but it was fun to write, and it's been a while since I've used Ruby in any significant way.

##Usage##
The presentation files are simply nested Ruby data structures, which are then evaluated (because it's easy to write, and easy to work with)

Here's the format:

    [{:background => <RGB value>, 
      :text => [
                [{:size => <size>, :color => <RGB value>},
                 <text>, x, y]...]} ... ]

Easy enough, yeah?

If you want to run this you need JRuby installed (because I wanted to use a cross-platform GUI toolkit).

To run: `jruby SlideRB.rb`

That's it!

Have fun playing with the ugly and quickly hacked together project ;)

