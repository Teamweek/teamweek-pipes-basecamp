module Teamweek
  module Pipes
    module Basecamp
      class Todos < Repository
        attr_accessor :user_ids

        def initialize(opts)
          super
          @user_ids = opts[:foreign_ids]
        end

        def pull_data
          user_ids.map do |user_id|
            client.assigned_todos(user_id, Date.today.iso8601)
          end.flatten
        end

        private

        def map_data(todo)
          {
            name: todo.content,
            foreign_id: todo.id,
            foreign_user_id: todo.assignee_id,
            foreign_project_id: todo.project_id,
            done: todo.completed,
            start_date: todo.due_at,
            end_date: todo.due_at
          }
        end
      end
    end
  end
end
