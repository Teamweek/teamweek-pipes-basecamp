require 'teamweek-pipes'

module Teamweek
  module Pipes
    module Basecamp

      Pipes.define :bcx, Flows::Pull do |source|
        source.name 'Basecamp Next'
        source.description '...'

        source.pipe :users, :users, -> options { Users.new(options).pull }
        source.pipe :accounts, :accounts, -> options { Accounts.new(options).pull }
      end
    end
  end
end
