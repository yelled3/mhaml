require 'tilt'

module MHaml
  class MHamlTemplate < Tilt::Template
    class << self
      attr_accessor :namespace
    end

    self.default_mime_type = 'application/javascript'
    self.namespace = "window.#{MHaml.template_namespace}"

    def evaluate(scope, locals, &block)
      template_key = path_to_key scope
      <<-MustacheTemplate
        (function() {
          #{namespace} || (#{namespace} = {});
          #{namespace}[#{template_key.inspect}] = function(object, partials) {
            if (partials == null) {
              partials = {};
            }
            var template = #{data.inspect};
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
