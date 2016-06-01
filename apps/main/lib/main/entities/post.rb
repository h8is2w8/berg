require "types"
require "main/entities/person"
require "main/entities/category"

module Main
  module Entities
    class Post < Dry::Types::Value
      Status = Types::Strict::String.default("draft").enum("draft", "published", "deleted")

      attribute :id, Types::Strict::Int
      attribute :title, Types::Strict::String
      attribute :body, Types::Strict::String
      attribute :teaser, Types::Strict::String
      attribute :slug, Types::Strict::String
      attribute :status, Status
      attribute :person_id, Types::Strict::Int
      attribute :published_at, Types::Strict::Time

      class WithAuthor < Post
        attribute :author, Entities::Person
      end

      class WithAuthorAndCategories < Post
        attribute :author, Entities::Person
        attribute :categories, Types::Strict::Array.member(Entities::Category)
      end
    end
  end
end