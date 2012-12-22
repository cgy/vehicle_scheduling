class Permission
  def initialize(user)
    allow :index_page, [:index]
    allow :static_pages, [:about, :contact]
    allow :sessions, [:new, :create, :destroy]
    if user.is_a? Driver
      allow :'drivers/status', [:start, :tour, :update]
      allow :'drivers/trips', [:index, :new, :create]
      allow :'drivers/trips', [:edit, :update, :destroy] do |trip|
        trip.driver.id == user.id
      end
      allow :'drivers/driver_history', [:index]
    end
    if user.is_a? Worker
      allow :'workers/status', [:start, :tour, :update]
      allow :'workers/trips', [:index]
      allow :'workers/trips', [:edit, :update] do |trip|
        trip.workers.exists? user
      end
      allow :'workers/worker_history', [:index]
    end
  end

  def allow?(controller, action, resource = nil)
    allowed = @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))
    #true
  end

  def allow(controllers, actions, &block)
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end

end