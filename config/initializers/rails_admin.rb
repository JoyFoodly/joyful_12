RailsAdmin.config do |config|

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
        label 'Provider id'
        help 'Example: Youtube embed id'
      end
    end
  end
end
