#include <rice/Data_Type.hpp>
#include <rice/Constructor.hpp>
#include <inttypes.h>

class Flags
{
  int32_t fl; 
public:
  Flags(int32_t val = 0) : fl(val) {};

  inline operator int32_t() const {return fl;}
  inline Flags&  operator=(int32_t const& val) {fl = val; return *this;}
  inline int32_t get() const {return fl;}
  inline int32_t set(int32_t s) {fl |= s; return fl;}
  inline bool    tstSome(int32_t s) const {return (fl & s);}
  inline bool    tstAll(int32_t s) const {return ((fl & s) == s);}
  inline int32_t clear(int32_t s = ~0) {fl &= ~s; return fl;}
};

using namespace Rice;
  
extern "C"
void Init_Flags()
{

  Module rb_cModule = define_module("Q");
  Class rb_cFlags =
    define_class_under<Flags>(rb_cModule, "Flags")
    .define_constructor(Constructor<Flags, int32_t>(),Arg("init")=0)
    .define_method("get", &Flags::get)
    .define_method("set", &Flags::set)
    .define_method("tstAll", &Flags::tstAll)
    .define_method("tstSome", &Flags::tstSome)
    .define_method("clear", &Flags::clear, Arg("clear")=~((int32_t)0));
//    .define_method("=", &Flags::operator=);
}

