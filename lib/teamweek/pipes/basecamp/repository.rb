module Teamweek
  module Pipes
    module Basecamp
      class Repository
        attr_reader :client
        USER_AGENT = "Teamweek Integration (support@teamweek.com)"

        def initialize(options)
          @client = build_client(options)
        end

        private

        def build_client(options)
          Logan::Client.new(
            options[:foreign_workspace_id],
            options[:auth],
            options[:user_agent] || USER_AGENT
          )
        end
      end
    end
  end
end
