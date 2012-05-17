module MHaml
  module Generators
    module Helpers

      def asset_path
        "app/assets"
      end

      def js_path
        "#{asset_path}/javascripts"
      end

      def app_path
        "app"
      end

    end
  end
end
