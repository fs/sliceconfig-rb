class Sliceconfig::Stack::Base < Sliceconfig::Stack
  include Sliceconfig::Manifest::SysytemTools

  register_stack :base
  recipe :install_perl
end
