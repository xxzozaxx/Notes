/* CFLAGS: -I/usr/include */
/* CFLAGS: -I/usr/lib/gcc/x86_64-linux-gnu/9/include */
/* CFLAGS: -I/usr/local/include */
/* CFLAGS: -I/usr/lib/gcc/x86_64-linux-gnu/9/include-fixed */
/* CFLAGS: -I/usr/include/x86_64-linux-gnu */
/* CFLAGS: -I/usr/include */
/* LIBS: c */
#include "termbox.h"

int 
termbox$tb_init(void)
{
	return tb_init();
}
int 
termbox$tb_init_file(char (*_a0))
{
	return tb_init_file(_a0);
}
int 
termbox$tb_init_fd(int _a0)
{
	return tb_init_fd(_a0);
}
void 
termbox$tb_shutdown(void)
{
	return tb_shutdown();
}
int 
termbox$tb_width(void)
{
	return tb_width();
}
int 
termbox$tb_height(void)
{
	return tb_height();
}
void 
termbox$tb_clear(void)
{
	return tb_clear();
}
void 
termbox$tb_set_clear_attributes(uint16_t _a0, uint16_t _a1)
{
	return tb_set_clear_attributes(_a0, _a1);
}
void 
termbox$tb_present(void)
{
	return tb_present();
}
void 
termbox$tb_set_cursor(int _a0, int _a1)
{
	return tb_set_cursor(_a0, _a1);
}
void 
termbox$tb_put_cell(int _a0, int _a1, struct tb_cell * _a2)
{
	return tb_put_cell(_a0, _a1, _a2);
}
void 
termbox$tb_change_cell(int _a0, int _a1, uint32_t _a2, uint16_t _a3, uint16_t _a4)
{
	return tb_change_cell(_a0, _a1, _a2, _a3, _a4);
}
void 
termbox$tb_blit(int _a0, int _a1, int _a2, int _a3, struct tb_cell * _a4)
{
	return tb_blit(_a0, _a1, _a2, _a3, _a4);
}
struct tb_cell *
termbox$tb_cell_buffer()
{
	return tb_cell_buffer();
}
int 
termbox$tb_select_input_mode(int _a0)
{
	return tb_select_input_mode(_a0);
}
int 
termbox$tb_select_output_mode(int _a0)
{
	return tb_select_output_mode(_a0);
}
int 
termbox$tb_peek_event(struct tb_event * _a0, int _a1)
{
	return tb_peek_event(_a0, _a1);
}
int 
termbox$tb_poll_event(struct  tb_event * _a0)
{
	return tb_poll_event(_a0);
}
int 
termbox$tb_utf8_char_length(char _a0)
{
	return tb_utf8_char_length(_a0);
}
int 
termbox$tb_utf8_char_to_unicode(uint32_t (*_a0), char (*_a1))
{
	return tb_utf8_char_to_unicode(_a0, _a1);
}
int 
termbox$tb_utf8_unicode_to_char(char (*_a0), uint32_t _a1)
{
	return tb_utf8_unicode_to_char(_a0, _a1);
}
