module BaseAPI
  extend ActiveSupport::Concern

  included do
    prefix "api"
    format :json
    formatter :json, Grape::Formatter::FastJsonapi
    error_formatter :json, ErrorFormatter
    default_format :json
    # Add active_record rescue below

    helpers do
      def authenticate!
        raise APIError::Unauthenticated unless current_user
      end

      def current_user
        @current_user ||= User.from_access_token(access_token_header)
      end

      def access_token_header
        headers[Settings.access_token_header]
      end

      def pagination_dict(object)
        {
          current_page: object.current_page,
          next_page: object.next_page,
          prev_page: object.prev_page,
          total_pages: object.total_pages,
          total_count: object.total_count
        }
      end
    end
  end
end