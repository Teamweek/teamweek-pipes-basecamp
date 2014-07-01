module Teamweek
  module Pipes
    module Basecamp
      class People < Repository

        def pull_data
          client.people
        end

        private

        def map_data(person)
          {
            name: person.name,
            email: person.email_address,
            foreign_id: person.id
          }
        end
      end
    end
  end
end
