require 'lib/services/profiler_service'

module Brunossilveira
  class Profiler
    def self.run!(*args)
      ProfilerService.call(*args)
    end
  end
end
