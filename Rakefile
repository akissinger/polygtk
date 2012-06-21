$GTK_CFLAGS = `pkg-config --cflags gtk+-2.0`
$GTK_LIBS = `pkg-config --libs gtk+-2.0`

task :default do
  sh %{gcc -fPIC -c test.c -o test.o #{$GTK_CFLAGS}}
  sh %{gcc -shared -Wl,-soname,libtest.so -o libtest.so test.o #{$GTK_LIBS}}
end

task :clean do
  rm_f Dir['*.o','*.so']
end