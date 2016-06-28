require 'services/profiler_service'

module Brunossilveira
  class Profiler
    def self.run!(*args)
      ProfilerService.new(*args).call
    end
  end
end
