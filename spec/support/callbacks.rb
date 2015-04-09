RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    @user = build(:user)
    DatabaseCleaner.cleaning do
      ActsAsTenant.with_tenant(@user) do
        example.run
      end
    end
  end
end

