require "rails_routes_csv/version"

module RailsRoutesCsv
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load "tasks/routes_csv.rake"
    end
  end
end
