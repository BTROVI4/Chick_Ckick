module UsersHelper
    def users_error_messages!
        ActiveSupport::Deprecation.warn <<-DEPRECATION.strip_heredoc
          [Users] `UsersHelper#users_error_messages!` is deprecated and will be
          removed in the next major version.
          Users now uses a partial under "users/shared/error_messages" to display
          error messages by default, and make them easier to customize. Update your
          views changing calls from:
              <%= users_error_messages! %>
          to:
              <%= render "users/shared/error_messages", resource: resource %>
          To start customizing how errors are displayed, you can copy the partial
          from users to your `app/views` folder. Alternatively, you can run
          `rails g users:views` which will copy all of them again to your app.
        DEPRECATION
    
        return "" if resource.errors.empty?
    
        render "users/shared/error_messages", resource: resource
      end
end
