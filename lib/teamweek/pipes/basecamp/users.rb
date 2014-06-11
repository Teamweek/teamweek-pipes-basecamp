module Teamweek
  module Pipes
    module Basecamp
      class Users < Repository

        def pull_data
          client.people
        end

        private

        def map_data(user)
          {
            name: user.name,
            email: user.email_address,
            foreign_id: user.id
          }
        end
      end
    end
  end
end
