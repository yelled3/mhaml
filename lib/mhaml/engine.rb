module MHaml
  class Engine < ::Rails::Engine
    initializer "sprockets.mhaml_rails", :after => "sprockets.environment", :group => :all do |app|
      next unless app.assets
      app.assets.register_engine(".#{MHaml.template_extension}", MHaml.MHamlTemplate)
      app.config.assets.paths << MHaml.template_base_path
    end
  end
end
