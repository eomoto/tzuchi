RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin == true
  end

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      controller do
        proc do
          if request.post? && params[@abstract_model.param_key].present?
            @object = @abstract_model.new
            attributes = params[@abstract_model.param_key]

            if attributes[:status].to_i == Article.statuses[:published]
              attributes[:published_at] = Time.now
            end

            permitted_attributes = attributes.permit(
              :title,
              :description,
              :author,
              :status,
              :body,
              :published_at,
              :tags,
              :image
            )
            @object.set_attributes(permitted_attributes)

            @object.save!
          elsif request.get?
            @object = @abstract_model.new
          end
        end
      end
    end
    export
    bulk_delete
    show
    edit do
      controller do
        proc do
          if request.put?
            attributes = params[@abstract_model.param_key]
            new_status = attributes[:status].to_i

            if new_status == Article.statuses[:draft]
              attributes[:published_at] = nil
            elsif Article.statuses[@object.status] != new_status
              attributes[:published_at] = Time.now
            end

            permitted_attributes = attributes.permit(
              :title,
              :description,
              :author,
              :status,
              :body,
              :published_at,
              :tags,
              :image
            )
            @object.set_attributes(permitted_attributes)

            @object.save!
          end
        end
      end
    end
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Article' do
    edit do
      configure :published_at do
        hide
      end
    end
  end
end
