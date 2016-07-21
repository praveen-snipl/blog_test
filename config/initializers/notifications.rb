# ActiveSupport::Notifications.subscribe "process_action.action_controller" do |name, start, finish, id, payload|
#             PageRequest.create! do |page_request|
#               page_request.path = payload[:path]
#               page_request.page_duration = (finish - start) * 1000
#               page_request.view_duration = payload[:view_runtime]
#               page_request.db_duration = payload[:db_runtime]
#             end
#         end
Subscriber.subscribe('article.updated') do |event|
   error = "Error: #{event.payload[:exception].first}" if event.payload[:exception]
   puts "#{event.transaction_id} | #{event.name} | #{event.time} | #{event.duration} | #{event.payload[:article].title} | #{error}"
    PageRequest.create! do |page_request|
      page_request.path = event.payload[:article].title+'article_created or updated'
      page_request.page_duration = event.duration * 1000
      page_request.view_duration = event.time
      page_request.db_duration = event.transaction_id
    end
end