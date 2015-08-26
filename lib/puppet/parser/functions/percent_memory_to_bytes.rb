module Puppet::Parser::Functions
  newfunction(:percent_memory_to_bytes, :type => :rvalue, :doc => <<-EOS

    EOS
  ) do |args|

    # Validate the number of args
    if args.size != 1
      raise(Puppet::ParseError, "bytes_percent_memory(): wrong number of arguments " +
            "given #{args.size}, require 1.")
    end

    percent = args[0]

    if percent.to_s != percent.to_i.to_s || percent.to_i < 0 || percent.to_i > 100
      raise(Puppet::ParseError, "bytes_percent_memory(): Requires a valid integer " +
            "between 0 and 100.")
    end

    memsize_mb = self.lookupvar('memorysize_mb')
    memsize_bytes = memsize_mb.to_f * 1024.0**2

    percent_mem = (percent.to_f / 100.0) * memsize_bytes.to_f
    percent_mem.to_i
  end
end
