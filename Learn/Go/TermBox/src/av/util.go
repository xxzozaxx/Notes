package main

import (
//	"fmt"
	termbox "github.com/nsf/termbox-go"
//	"gopkg.in/mattn/go-runewidth.v0"
)


func debug(n, y int, msg string) {
	w, h := termbox.Size()
	tbPrint(w-y, h-n, cldef, termbox.ColorRed, msg)
}