require 'readline'

$GTK_CFLAGS = `pkg-config --cflags gtk+-2.0`
$GTK_LIBS = `pkg-config --libs gtk+-2.0`

task :config do
  do_config = true
  if File.exist?('config.rb')
    ans = Readline.readline('config.rb exists, overwrite? [yN] ')
    do_config = ans[0,1].downcase == 'y'
  end
  
  if do_config
    isaplib_home = Readline.readline('isaplib home: [../isaplib/] ')
    isaplib_home = '../isaplib/' if isaplib_home == ''
    isaplib_home = File.expand_path(isaplib_home)
    
    File.open('config.rb','w') do |f|
      f.puts("$ISAPLIB_HOME = '#{isaplib_home}'")
    end
  end
end

task :loadconfig do
  Rake::Task["config"].invoke unless File.exist?('config.rb')
  require 'config.rb'
end

task :mlconfig => [:loadconfig] do
  File.open('src/config.ML','w') do |f|
    f.puts %{
    structure Config_ =
    struct
      val ISAPLIB_HOME = "#{$ISAPLIB_HOME}"
    end
    }
  end
end

task :isaplib_heap => [:loadconfig] do
  puts 'Ensuring the isaplib heap is built...'
  basedir = Dir.pwd
  cd $ISAPLIB_HOME
  sh %{make}
  cd basedir
end


file 'libpolygtk.so' => ['src/ml_helpers.c'] do
  puts 'Building C helper functions...'
  cd 'src'
  sh %{gcc -fPIC -c ml_helpers.c -o ml_helpers.o #{$GTK_CFLAGS}}
  sh %{gcc -shared -Wl,-soname,libpolygtk.so -o ../libpolygtk.so ml_helpers.o #{$GTK_LIBS}}
  cd '..'
end

task :default => [:loadconfig,:mlconfig,:isaplib_heap,'libpolygtk.so']

task :run => [:default] do
  if ENV['example'] == nil
    puts
    puts 'Usage: rake run example=XXX'
    puts '  where XXX is one of:'
    Dir['*/e_*.ML'].each {|e| puts '    ' + e[11,e.length-14]}
    puts
  else
    ml = %{
      OS.FileSys.chDir "src/";
      use "gtk_base.ML";
      OS.FileSys.chDir "../examples/";
      use "e_#{ENV['example']}.ML";
      main(); }
    sh %{echo '#{ml}' | LD_LIBRARY_PATH=#{Dir.pwd}:$LD_LIBRARY_PATH poly}
  end
end

task :clean do
  rm_f Dir['*.o','*.so','config.ML']
end