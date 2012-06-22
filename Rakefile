$GTK_CFLAGS = `pkg-config --cflags gtk+-2.0`
$GTK_LIBS = `pkg-config --libs gtk+-2.0`

require 'config.rb'

task :default do
  sh %{gcc -fPIC -c ml_helpers.c -o ml_helpers.o #{$GTK_CFLAGS}}
  sh %{gcc -shared -Wl,-soname,libpolygtk.so -o libpolygtk.so ml_helpers.o #{$GTK_LIBS}}
end

task :clean do
  rm_f Dir['*.o','*.so']
end