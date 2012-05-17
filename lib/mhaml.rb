require "mhaml/version"
require "mhaml/config"

module MHaml
  extend Config

  autoload(:MHamlTemplate, 'mhaml/mhaml_template')

  if defined?(Rails)
    require 'mhaml/engine'
  else
    require 'sprockets'
    Sprockets.register_engine ".#{MHaml.template_extension}", MHamlTemplate
  end
end

# init action view handler
require "mhaml/railtie"
