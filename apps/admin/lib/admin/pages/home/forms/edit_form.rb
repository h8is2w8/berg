require "berg/form"

module Admin
  module Pages
    module Home
      module Forms
        class EditForm < Berg::Form
          include Admin::Import(
            "admin.persistence.repositories.home_page_featured_items"
          )

          prefix :page

          define do
            many :home_page_featured_items,
              label: "Featured Items",
              action_label: "Add a featured item",
              placeholder: "No featured items added yet." do
                text_field :title,
                  label: "Title"

                text_field :description,
                  label: "Description"

                text_field :url,
                  label: "URL"

                text_field :highlight_color,
                  label: "Highlight Colour",
                  placeholder: "Six-digit hexadecimal code"

                upload_field :cover_image,
                  label: "Cover Image",
                  presign_url: "/admin/uploads/presign"
              end
          end
        end
      end
    end
  end
end
