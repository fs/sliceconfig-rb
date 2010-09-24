module Sliceconfig::Manifest::SysytemTools
  def install_perl
    package 'perl', :ensure => :installed
  end

  def install_sendmail
    package 'sendmail', :ensure => :installed
  end
end