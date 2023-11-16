require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VitrailDocs
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.eager_load_paths << Vitrail::Engine.root.join("test/components/previews")
    config.eager_load_paths << Vitrail::Engine.root.join("test/components/docs")

    config.lookbook.preview_paths << Vitrail::Engine.root.join("test/components/previews")
    config.view_component.preview_paths << Vitrail::Engine.root.join("test/components/previews")
    config.lookbook.page_paths = [Vitrail::Engine.root.join("test/components/docs")]
    config.lookbook.preview_layout = "vitrail/component_preview"
    config.lookbook.project_name = "Vitrail"
    config.lookbook.project_logo = false
    config.lookbook.ui_favicon = false
    config.lookbook.preview_collection_label = "Components"
    config.lookbook.page_collection_label = "Docs"
    config.lookbook.ui_theme = "zinc"
    config.lookbook.preview_inspector.drawer_panels = [:notes, :source]
  end
end
