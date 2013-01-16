require 'digest/md5'

module Md5app
  class Md5Dir
    def initialize(root, file=nil)
      @file = file || STDOUT
      @root = File.absolute_path(root)
      unless File.exists?("#{@root}/.md5ignore")
        @skip_paths = []
      else
        @skip_paths = File.new("#{@root}/.md5ignore").readlines.map do |line| 
          line = line[/\A#/] ? nil : line.chomp.strip
          line = line && line.empty? ? nil : line
          line
        end.compact
      end
    end

    def build_tree
      recursive(@root)
    end

    def recursive(dir, depth=0)
      Dir.chdir(dir) do
        Dir.entries(Dir.pwd).sort.each do |entry|
          next if ['.', '..'].include?(entry)

          skip = false
          @skip_paths.each do |mask|
            skip = File.fnmatch("#{@root}/#{mask}", File.absolute_path(entry))
            break if skip
          end
          next if skip

          if File.file?(entry)
            @file.print Digest::MD5.hexdigest(File.read(entry)), ' ', File.absolute_path(entry), "\n"
          end

          if File.directory?(entry) && !File.symlink?(entry)
            recursive(entry, depth + 1)
          end
        end
      end
    end
  end
end
