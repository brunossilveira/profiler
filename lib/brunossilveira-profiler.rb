# Models
require 'models/row'

# Utils
require 'utils/mapper'
require 'utils/messages'
require 'utils/parser'

# Services
require 'services/profiler_service'

module Brunossilveira
  class Profiler
    def self.run!(*args)
      ProfilerService.new(*args).call
    end
  end
end
