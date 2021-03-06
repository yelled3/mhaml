module MHaml
  # Change config options in an initializer:
  #
  # MHaml.template_extension = 'mhaml'
  #
  # Or in a block:
  #
  # MHaml.configure do |config|
  #   config.template_extension = 'mhaml'
  # end

  module Config
    attr_accessor :template_base_path, :template_extension, :action_view_key, :template_namespace

    def configure
      yield self
    end

    def template_base_path
      @template_base_path ||= Rails.root.join("app", "views")
    end

    def template_extension
      @template_extension ||= 'mhaml'
    end

    def action_view_key
      @action_view_key ||= 'mhaml'
    end

    def template_namespace
      @template_namespace ||= 'mhaml'
    end
  end
end
