module Teamweek
  module Pipes
    module Basecamp
      class Repository
        attr_reader :client

        def initialize(options)
          @client = build_client(options)
        end

        private

        def build_client(options)
          Logan::Client.new(
            options[:basecamp_id],
            options[:auth],
            options[:user_agent]
          )
        end
      end
    end
  end
end
