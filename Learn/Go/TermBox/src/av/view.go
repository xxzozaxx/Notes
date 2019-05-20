package main

import (
//	"fmt"
	termbox "github.com/nsf/termbox-go"
	"gopkg.in/mattn/go-runewidth.v0"
)

/* write msg starting from point (x,y) w/ color fg and bg */
func tbPrint(x, y int, fg, bg termbox.Attribute, msg string) {
	for _, c := range msg {
		termbox.SetCell(x, y, c, fg, bg)
		x += 1
	}
}

/* print cell from (x,y) by (w,h) char square TODO: make this comment obvious */
func fill (x, y, w, h int, cell termbox.Cell){
	for ly := 0; ly < h; ly++ {
		for lx := 0; lx < w; lx++ {
			termbox.SetCell(x+lx, y+ly, cell.Ch, cell.Fg, cell.Bg)
		}
	}
}

/* print icon first then print tag and fill space te whole line w/ tag bg color*/
func tagPrint(x,y,w int, tool string) {
	tag := runewidth.Truncate(tool, w, "")

	tbPrint(x, y, cldef, iconbg, string(icon))
	tbPrint(x+1, y, tagfg, tagbg, tag)
	if tagLen:= runewidth.StringWidth(tool); tagLen < w {
		fill(x+tagLen, y, w - tagLen + 1, 1, termbox.Cell{Bg:tagbg})
	}
}

func (w *win) printBody(cx, cw int) {
	for i, e := range w.rows {
		if i < w.y + 1 {
			txt := runewidth.Wrap(e.body, cw)
			tbPrint(cx + 1, w.y + 1 + i, cldef, cldef, txt)
		}
	}
}

func (w *win) drawTag(cx, cw int){
	tagPrint(cx, w.y, cw, wintool)
}

func (c *col) drawTag() {
	tagPrint(c.x, 1, c.w, coltool)
}

func (e *av) drawTag() {
	w, _ := termbox.Size()
	tagPrint(0, 0, w, maintool)
}

func (e *av) draw() {
	// print tag
	e.drawTag()
	for _, c := range e.cols {
		c.drawTag()
		if winNum := len(c.wins); winNum == 0 {
			// clean the body
			_, h := termbox.Size() // extra computation, see av.drawTag()
			fill(c.x, 2, c.w, h, termbox.Cell{Bg:cldef})
		} else {
			for _, w := range c.wins {
				w.drawTag(c.x, c.w)
				w.printBody(c.x, c.w);
				// TODO: clean windows body
//				debug(1,50, fmt.Sprintf("win: c.x %d | c.w %d", c.x, c.w))
//				termbox.Flush()
			}
		}
	}
	err := termbox.Flush()
	if err != nil {
		panic(err)
	}
}
