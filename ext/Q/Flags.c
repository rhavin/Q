# include "ruby.h"

static VALUE t_init(VALUE self)
{
  return self;
}

static VALUE t_check(VALUE self)
{
  return INT2FIX(15);
}

VALUE Qmodule;
VALUE FlagValueClass;

void Init_Flags()
{

  Qmodule = rb_define_module("Q");
  FlagValueClass = rb_define_class_under(Qmodule, "Flags", rb_cObject);

  rb_define_method(FlagValueClass, "initialize", t_init, 0);
  rb_define_method(FlagValueClass, "check", t_check, 0);
}
