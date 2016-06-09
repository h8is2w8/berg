require "main/import"
require "main/view"
require "main/decorators/public_post"

module Main
  module Views
    module Pages
      class Feed < Main::View
        include Main::Import("main.persistence.repositories.posts")

        def call(options = {})
          template_path = "#{config.root}/pages/feed.#{options[:format]}.#{options[:engine]}"
          Tilt::BuilderTemplate.new(template_path).render( posts: Decorators::PublicPost.decorate(posts.all) )
        end
      end
    end
  end
end
