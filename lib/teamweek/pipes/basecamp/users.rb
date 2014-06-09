module Teamweek
  module Pipes
    module Basecamp
      class Users < Repository

        def pull
          client.people.map { |user| map_user(user) }
        end

        private

        def map_user(user)
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
