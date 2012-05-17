require 'tilt'
require 'haml'
module MHaml
  class MHamlTemplate < Tilt::Template
    def self.default_mime_type
      'application/javascript'
    end

    def self.engine_initialized?
      true
    end

    def prepare
      @namespace = "this.#{MHaml.template_namespace}"
    end

    attr_reader :namespace

    def evaluate(scope, locals, &block)
      template_key = path_to_key scope
      code = Haml::Engine.new(data, Haml::Template.options.merge(:escape_attrs => false)).render(scope, locals)
      <<-MustacheTemplate
        (function() {
          #{namespace} || (#{namespace} = {});
          #{namespace}[#{template_key.inspect}] = function(object, partials) {
            if (partials == null) {
              partials = {};
            }
            var template = #{code};
            if (object == null){
              return template;
            } else {
              return Mustache.render(template, object, partials);
            }
          };
        }).call(this);
      MustacheTemplate
    end

    def path_to_key(scope)
      path = scope.logical_path.to_s.split('/')
      path.last.gsub!(/^_/, '')
      path.join('/')
    end
  end
end
