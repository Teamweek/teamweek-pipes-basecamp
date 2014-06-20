module Teamweek
  module Pipes
    module Basecamp
      class Accounts
        attr_reader :client

        def initialize(options)
          @client = options[:client]
        end

        def pull
           response = client.get('/authorization.json')
           parse_response(response.parsed)
        end

        private

        def parse_response(data)
          accounts_data["accounts"].map{|item| map_data(item)}.compact
        end

        def map_data(account)
          return nil unless account["product"] == "bcx"
          {
            name: account["name"],
            id: account["id"]
          }
        end
      end
    end
  end
end
