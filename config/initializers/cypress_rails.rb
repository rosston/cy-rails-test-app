return unless Rails.env.test?

Rails.application.load_tasks unless defined?(Rake::Task)

CypressRails.hooks.before_server_start do
  # Called once, before either the transaction or the server is started
  # Rake::Task["db:reset"].invoke
  Rake::Task["db:test:prepare"].invoke
  Rake::Task["db:seed"].invoke
end

CypressRails.hooks.after_transaction_start do
  # Called after the transaction is started (at launch and after each reset)
end

CypressRails.hooks.after_state_reset do
  # Triggered after `/cypress_rails_reset_state` is called
end

CypressRails.hooks.before_server_stop do
  # Called once, at_exit
  # Modern Front end with Rails 7 has the following line in the server_stop hook
  # It seems to clear the database, but I don't need that since I'm calling
  # db:reset in the server_start hook:
  # Rake::Task["db:test:prepare"].invoke
end
