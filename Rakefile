require 'bundler/gem_tasks'
require 'rake'
require 'rake/extensiontask'
$myDir = File.dirname(__FILE__)

require $myDir + '/lib/Q/console.rb'
require $myDir + '/lib/Q/version.rb'
require $myDir + '/lib/Q/rakeoverride.rb'
require $myDir + '/lib/Q/filetools.rb'

# this task just prints out a header and gems version number
puts Q::Console.txHead('ShadowTec Q-Pool Ruby Extension Q V' + Q::VERSION)

# load specifiation from gemspec and create
# a task for every extension file in
# executables.
spec = Gem::Specification.load('Q.gemspec')
spec.executables.each do |f|
  Rake::ExtensionTask.new('Q', spec) do |ext|
    # extension file is *.so, so we need
    # to chop the extension to get the name
    ext.name    = f.gsub(/\.so$/,'')
    ext.tmp_dir = 'tmp'
    ext.lib_dir = 'bin'
  end
end

# clean environment by removing old binaries
override_task :clean do
  puts Q::Console.txNote('cleaning...')
  clear_tmp
  begin
    Rake::Task["clean:original"].invoke
    puts Q::Console.txConfirm('...cleaned!')
  rescue 
    puts Q::Console.txAlert('could not clean: ' + $!.to_s)
    exit
  end
end

# initialize directory structure
task :init do
  FileCheckCreateDirectory($myDir + '/bin')
  FileCheckCreateDirectory($myDir + '/tmp')
end

# compile module and install to lib
override_task :compile do
  puts Q::Console.txNote('compiling...')
  begin
    Rake::Task["compile:original"].invoke
    puts Q::Console.txConfirm('...compiled!')
  rescue Exception
    puts Q::Console.txAlert('could not compile: ' + $!.to_s)
    exit
  ensure
    clear_tmp
    puts
  end
end

# show commands
task :help do
  show_help
end

# also show commands of task was not defined
rule '' do |t|
  Q::Console.out(Q::Console.txWarn('Command ' + Q::Console.txBold(t) + ' is unknown!'))
  show_help
end

# build module and install
task :build => [:init, :clean, :compile]

Bundler::GemHelper.install_tasks

# remove any temporary files
def clear_tmp
  FileUtils.rm_rf(Dir.glob($myDir + '/tmp/*'))
end

# display help screen
def show_help
  Q::Console.out(Q::Console.txCode('build') + '      performs init, clean and compile.')
  Q::Console.out(Q::Console.txCode('clean') + '      removes any old binaries from temp-dir.')
  Q::Console.out(Q::Console.txCode('compile') + '    compiles binaries.')
  Q::Console.out(Q::Console.txCode('help') + '       enlists rake-commands (this page).')
  Q::Console.out(Q::Console.txCode('init') + '       creates gems directory structure.')
  puts
end
