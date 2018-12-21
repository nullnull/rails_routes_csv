# See gems/actionpack-4.2.1/lib/action_dispatch/routing/inspector.rb

require 'csv'

desc <<-EOS
  desc. routes_csv
EOS

namespace :routes do
  desc 'Print out all defined routes in CSV format.'
  task csv: :environment do
    class CSVFormatter
      def initialize
        @buffer = []
      end

      def result
        CSV.generate do |csv|
          @buffer.each do |record|
            csv << record
          end
        end
      end

      def section_title(title)
        @buffer << [title.to_s]
      end

      def section(routes)
        routes.map do |r|
          z = r[:reqs].split('#')
          controller = ''
          method = ''
          unless z.empty?
            controller = z[0]
            method = z[1]
          end
          @buffer << [(r[:name]).to_s, (r[:verb]).to_s, (r[:path]).to_s, controller.to_s, method.to_s]
        end
      end

      def header(_routes)
        @buffer << ['Prefix', 'Verb', 'URI Pattern', 'Controller#Action']
      end

      def no_routes
        str = <<-MESSAGE.strip_heredoc
          You don't have any routes defined!
          Please add some routes in config/routes.rb.
          For more information about routes, see the Rails guide: http://guides.rubyonrails.org/routing.html.
        MESSAGE
        @buffer << [str]
      end
    end

    all_routes = Rails.application.routes.routes
    require 'action_dispatch/routing/inspector'
    inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
    puts inspector.format(CSVFormatter.new, ENV['CONTROLLER'])
  end
end
