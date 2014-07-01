require 'teamweek-pipes'

module Teamweek
  module Pipes
    module Basecamp

      Pipes.define :bcx, Flows::Pull do |source|
        source.name 'Basecamp Next'
        source.description '...'

        source.pipe :users, :users, -> options { People.new(options).pull }
        source.pipe :accounts, :accounts, -> options { Accounts.new(options).pull }
        source.pipe :projects, :projects, -> options { Projects.new(options).pull }
        source.pipe :tasks, :todos, -> options { Todos.new(options).pull }
      end
    end
  end
end
