module Teamweek
  module Pipes
    module Basecamp
      class Projects < Repository

        def pull_data
          client.projects
        end

        private

        def map_data(project)
          {
            name: project.name,
            foreign_id: project.id
          }
        end
      end
    end
  end
end
