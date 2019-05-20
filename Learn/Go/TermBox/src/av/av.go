package main

import (
	"errors"
//	"fmt"
	termbox "github.com/nsf/termbox-go"
//	"gopkg.in/mattn/go-runewidth.v0"
)

type av struct {
	tag string 		/* Tag tools*/
	cols []*col

//	w, h int
}

type col struct {
	tag string
	wins []*win
	x, w int
}

type win struct {
	tag string
//	body string
	rows []*row
	y, h int
}

type row struct {
	body string
}
/*** win functions ***/
func (w *win) resize() {
	w.h = w.h / 2
}

func (w *win) makeRow() {
	w.rows = append(w.rows, &row{string("")})
}

/*** col functions ***/
func (c *col) resize() {
	c.w = c.w / 2
}

func (c *col) makeWin() error {
	winLen := len(c.wins)
	_, h := termbox.Size()
	var emptyRow []*row

	if winLen == 0 {
		debug(1, 55, "Here")
		w := &win{ wintool, emptyRow, 2, h}
		c.wins = append(c.wins, w)
	} else {
		lastWin := c.wins[winLen - 1]
		if lastWin.y == h - 1 {
			errors.New("Now place for new windows")
		}
		lastWin.resize()
		w := &win{ wintool, emptyRow, lastWin.y + lastWin.h, lastWin.h }
		c.wins = append(c.wins, w)
	}

	return nil
}

/*** av functions ***/
func (e *av) init() {
	e.tag = maintool
	e.cols = []*col{}
//	e.w, e.h = termbox.Size()
}

/*
 * USER will deal with this function
 */
func (e *av) makeCol() error {
	colLen := len(e.cols)
	w, _ := termbox.Size()
//	debug(3,100, fmt.Sprintf("w = %d", w))

	if colLen == 0 {
		c := &col{ coltool, []*win{}, 0, w }
		e.cols = append(e.cols, c)
	} else {
		lastCol := e.cols[colLen - 1]

		// chech if there is a place for new colume
		// at least one empty colume should be there
		if lastCol.x == w - 1 {
			errors.New("Now Place for new colume")
		}
		lastCol.resize()
		c := &col{ coltool, []*win{}, lastCol.x + lastCol.w, lastCol.w }
		// TODO: lastCo.w should be checked to bee true in previous line
		e.cols = append(e.cols, c)

		// FIXME Debugging print extra '2' digit in c.w or its actully **buggy**
//		debug(2,100, fmt.Sprintf("c.x %d | c.w %d", c.x, c.w))
//		debug(1,100, fmt.Sprintf("last.x = %d, last.w = %d", lastCol.x, lastCol.w))
//		termbox.Flush()
	}

	return nil
}


/*** Main function and loop ***/
func main() {
	err := termbox.Init()
	if err != nil {
		panic(err)
	}
	defer termbox.Close()

	av := av{}
	av.init()
	if e := av.makeCol(); e != nil {
		panic("No space for basic colume")
	}
	av.cols[0].makeWin()
	av.cols[0].wins[0].makeRow()
	av.cols[0].wins[0].rows[0].body = "Hello World, مرحبا, this is sooooooooooo long"
	av.cols[0].wins[0].makeRow()
	av.cols[0].wins[0].rows[1].body = "\tTHis is the second line of bla bla bla" //TODO: enalbe formatting


	av.draw()

mainloop:
	for {
		switch ev := termbox.PollEvent(); ev.Type {
		case termbox.EventKey:
			switch ev.Key {
			case termbox.KeyEsc:
				break mainloop
			case termbox.KeyCtrlC:
				av.makeCol()
				av.draw()
			case termbox.KeyCtrlW:
				av.cols[0].makeWin()
				av.draw()
			case termbox.KeyCtrlE:
				av.cols[1].makeWin()
				av.draw()
			}
		case termbox.EventResize:
			// av.resizeAll(); TODO: implementation
			av.draw()
		}
	}
}