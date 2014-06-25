require 'basecamp-ruby'
module Teamweek
  module Pipes
    module Basecamp
      class Repository
        attr_reader :client

        def initialize(options)
          @client = build_client(options)
        end

        def pull
           pull_data.map{|item| map_data(item)}
        end

        private

        def build_client(options)
          ::Basecamp::Client.new(
            options[:http_client],
            options[:foreign_workspace_id]
          )
        end
      end
    end
  end
end
