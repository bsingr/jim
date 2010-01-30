module Jim
  class Bundler
    class MissingFile < Jim::Error; end
    
    attr_accessor :jimfile, :index, :requirements, :paths, :options 
   
    def initialize(jimfile, index, options = {})
      self.jimfile      = jimfile.is_a?(Pathname) ? jimfile.read : jimfile
      self.index        = index
      self.options      = {}
      self.requirements = []
      parse_jimfile
      self.options.merge(options)
      self.paths        = []
    end
    
    def resolve!
      self.requirements.each do |search|
        name, version = search.strip.split(/\s+/)
        path = index.find(name, version)
        if !path
          raise(MissingFile, 
          "Could not find #{name} #{version} in any of these paths #{index.directories.join(':')}")
        end
        self.paths << path
      end
      paths
    end
    
    def bundle!(to = nil)
      resolve! if paths.empty?
      to = options[:bundled_path] if to.nil? && options[:bundled_path]
      io = io_for_path(to)
      paths.each do |path|
        io << path.read
      end
      io
    end
    
    def compress!(to = nil)
      to = options[:compressed_path] if to.nil? && options[:compressed_path]
      io = io_for_path(to)
      io << js_compress(bundle!(false))
      io
    end
    
    def vendor!(dir = nil)
      resolve! if paths.empty?
      dir ||= options[:vendor_dir]
      dir ||= 'vendor' # default
      paths.each do |path|
        i = Jim::Installer.new(path, nil)
        i.determine_name
        i.determine_version
        path.cp vendor_dir + "#{name}-#{version}#{path.extname}"
      end
    end
    
    private
    def io_for_path(to)
      case to
      when IO
        to
      when Pathname
        to.dirname.mkpath
        to.open('w')
      when String
        to = Pathname.new(to)
        io_for_path(to)
      else
        ""
      end
    end
   
    def parse_jimfile
      jimfile.each_line do |line|
        if /^\/\/\s?([^\:]+)\:\s(.*)$/.match line
          self.options[$1.to_sym] = $2.strip
        elsif line.strip != ''
          self.requirements << line
        end
      end
    end
    
    def js_compress(uncompressed)
      ::Closure::Compiler.new(options[:compressor] || {}).compress(uncompressed)
    end
    
  end
end