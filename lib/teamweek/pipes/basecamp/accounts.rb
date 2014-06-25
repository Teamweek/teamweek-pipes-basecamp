module Teamweek
  module Pipes
    module Basecamp
      class Accounts < Repository

        def pull_data
          client.accounts
        end

        private

        def map_data(account)
          {
            name: account.name,
            id: account.id
          }
        end
      end
    end
  end
end
