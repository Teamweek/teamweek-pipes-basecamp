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
            client.assigned_todos(user_id)
          end.flatten
        end

        private

        def map_data(todo)
          return unless acceptable_date?(todo.due_at)
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

        def acceptable_date?(date)
          return true if !date.nil? && !date.blank? && future?(date)
        end

        def future?(date)
          Date.iso8601(date) >= Date.today
        end
      end
    end
  end
end
