require "gitorious/search/version"
require "thinking_sphinx"
require "gitorious/search/index_compat"

module Gitorious
  module Search
    class Railtie < Rails::Railtie
      rake_tasks do
        load "thinking_sphinx/tasks.rb"
      end
      ActiveSupport::on_load :active_record do
        if RUBY_VERSION < "1.9"
          IndexCompat.setup_indices
        end
      end
    end
  end
end
