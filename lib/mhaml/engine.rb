module MHaml
  class Engine < ::Rails::Engine
    #config.before_configuration do |app|
    #  app.paths['app/views'] << MHaml.template_base_path
    #end

    initializer "sprockets.mhaml_rails", :after => "sprockets.environment", :group => :all do |app|
      next unless app.assets
      app.assets.register_engine(".#{MHaml.template_extension}", Tilt)
      app.config.assets.paths << MHaml.template_base_path
    end
  end
end
