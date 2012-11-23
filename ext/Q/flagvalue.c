# include "ruby.h"

static VALUE t_init(VALUE self)
{
  return self;
}

static VALUE t_check(VALUE self)
{
  return 15;
}

void Init_FlagValue()
{
  VALUE cFlagValue = rb_define_class("FlagValue", rb_cObject);
  rb_define_method(cFlagValue, "initialize", t_init, 0);
  rb_define_method(cFlagValue, "check", t_check, 0);
}
