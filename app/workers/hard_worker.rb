class HardWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(requests)
    #HardWorker.refresh(request).deliver_now
  end
end
