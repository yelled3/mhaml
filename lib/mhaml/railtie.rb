require "mustache"
require "active_support"

module MHaml
  module Mustache
    def self.call(template)
      #if template.locals.include?(MHaml.action_view_key.to_s) || template.locals.include?(MHaml.action_view_key.to_sym)
        ::Mustache.template_path = MHaml.template_base_path
        haml = "Haml::Engine.new(#{template.source.inspect}).render"
        "Mustache.render(#{haml}, local_assigns).html_safe"
      #else
      #  "#{template.source.inspect}.html_safe"
      #end
    end
  end
end

ActiveSupport.on_load(:action_view) do
  ActionView::Template.register_template_handler(::MHaml.template_extension.to_sym, ::MHaml::Mustache)
end







