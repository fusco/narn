# Include hook code here
unless File.exist?(File.dirname(__FILE__) + "/../engines")
  Commands::Plugin.parse!(['install', 'git://github.com/lazyatom/engines.git'])
end

def copy_files(source_path, destination_path, directory)
  source, destination = File.join(directory, source_path), File.join(RAILS_ROOT, destination_path)
  FileUtils.mkdir(destination) unless File.exist?(destination)
  FileUtils.cp_r(Dir.glob(source+'/*.*'), destination)
end

directory = File.dirname(__FILE__)

copy_files("/script", "/script", directory)
