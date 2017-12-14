function that calculates distance between points
```
func distance(x1, y1, x2, y2 int) float
```

that's pretty wordy!

let's make a type called point

```
type point struct {
  x, y int
}
func distance (p1, p2 point) float
```

is this OOP?
distance(p1, p2)

http://spf13.com/post/is-go-object-oriented/

what if we do this?
```
func (p point) Subtract(o point) float
```
we can define a structure to hold data, and provide associated functions to work with it
CLOSE ENOUGH

```
func (p point) Move(dx, dy int) {
  p.x += dx
  p.y += dy
}
```

wait why didn't that do anything?
it may help to know what the compiler is _really_ doing

```
func Move(p point, dx, dy int) {
  // notice that it is passing in a **copy** of the struct
}
```

```
func (p *point) Move(dx, dy int) {
  p.x += dx
  p.y += dy
}
```

yay! now it works
tldr: if you want to modify the struct, the "receiver" should be a pointer

let's make another type
```
type circle struct {
  x,y int
  radius int
}
```

now let's move the circle

```
func (c *circle) Move(dx, dy int) {
  c.x += dx
  c.y += dy
}
```

ugh, this is lame

go doesn't have inheritance, but I can compose a type using other types
## Composition

```
type circle struct {
  *point
  radius int
}

func main() {
  p := circle{}
  p.Move(1,1)
  fmt.Printf("%#v")
}
```

ah pointers!

we have a few options
* make move treat nil points as 0,0
* set the point when we make it
* use a constructor

okay now let's make more types!

```
type line struct {
  start, stop point
}
```

let's make it move too!
can't use point.Move for free anymore

```
func (l *line) Move(dx, dy int) {
  start.Move(dx, dy)
  stop.Move(dx, dy)
}
```

What if I want to be able to move anything?

```
type shape interface {
  Move(dx, dy int)
}
```

I don't have to change the types!

```
var s shape

s = point{}
s.Move(1,1)
fmt.Printf("%#v", s)

s = line{stop{1,1}}
s.Move(2,2)

fmt.Printf("%#v", s)
```

Here's a very useful interface: fmt.Stringer


```
func (p point) String() string {
  return fmt.Printf("(%s, %s)", p.x, p.y)
}

func main() {
  p := point{}
  fmt.Println(p)

  c := circle{radius: 5}
  fmt.Println(c)
}
```

What type am I working with?
sometimes you need to know what you are dealing with
* casting
* switch/cast

extending a type from another package

```
package main

import "fmt"

type color string

const (
	  red color = "\x1b[31;1m"
	    blue color = "\x1b[34;1m"
    )

    func (c color) Println(msg string) {
	      fmt.Printf("%s%s\n", c, msg)
      }

func main() {
	red.Println("hi")
	blue.Println("bye")
}

```

best practices
* when to use a pointer or the struct for the receiver?
  * ease of use
  * memory usage (stack v. heap)
* when to define an interface?
  * you have more than 1 thing that does the same thing
  * saving a file to an api, to a database, to the filesystem
