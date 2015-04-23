RailsAdmin.config do |config|
  config.included_models = ["Coupon", "Partner", "Media", "User", "Admin", "Page", "Food", "Recipe", "VideoLink", "Image", "Ingredient", "Pdf", "Season", "HomePageFeature", "ShippingAddress", "IngredientListItem", "ViewRecord"]

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
     warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'Admin', 'PaperTrail::Version'


  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Coupon' do
    edit do
      field :description
      field :price
      field :gift_price
      field :shareable_tag do
        label 'Coupon Name'
        help 'Enter a coupon name you\'ll send as text. It must be alphanumeric - underscores and periods are also allowed.'
      end

      field :shareable_link
      configure :shareable_link do
        read_only true
      end
    end
  end
  
  config.model 'User' do
    object_label_method do
      :fullname
    end
  end

  def fullname
    "#{self.first_name} #{self.last_name}"
  end

  # Media Config
  config.model 'Media' do
    list do
      field :id
      field :file do
        label 'Original'
      end
      field :thumbnail do
        formatted_value do
          v = bindings[:view]
          v.link_to(v.image_tag(bindings[:object].file.url(:thumbnail), class: 'img-polaroid'),
                    bindings[:object].file.url(:thumbnail), target: 'blank')
        end
      end
      field :created_at
      field :updated_at
    end
  end

  # Video Link Config
  config.model 'VideoLink' do
    edit do
      configure :provider_id do
        label 'Provider ID'
        help 'Example: YouTube Embed ID'
      end
    end
  end
end
