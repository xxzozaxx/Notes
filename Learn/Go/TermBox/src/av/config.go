package main

import (
	termbox "github.com/nsf/termbox-go"
)

const cldef = termbox.ColorDefault
const maintool = " Newcol Kill Putall Dump Exit"
const coltool  = " New Cut Paste Snarf Sort Delcol"
const wintool  = " PWD Del Undo | Look"
const tagbg = termbox.ColorCyan
const tagfg = termbox.AttrBold
const icon = '•' // lets have fun, TODO: check that icon is 1 character fo now plz make it 1 char
const iconbg = termbox.ColorMagenta