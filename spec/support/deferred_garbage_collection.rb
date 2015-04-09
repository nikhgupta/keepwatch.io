class DeferredGarbageCollection

  DEFERRED_GC_THRESHOLD = (ENV['DEFER_GC'] || 15.0).to_f

  @@last_gc_run = Time.now

  def self.start
    GC.disable
  end

  def self.reconsider
    if Time.now - @@last_gc_run >= DEFERRED_GC_THRESHOLD
      GC.enable
      GC.start
      GC.disable
      @@last_gc_run = Time.now
    end
  end
end

# Improves performance by forcing the garbage collector to run less often.
unless ENV['DEFER_GC'] == '0' || ENV['DEFER_GC'] == 'false'
  require 'support/deferred_garbage_collection'
  RSpec.configure do |config|
    config.before(:all) { DeferredGarbageCollection.start }
    config.after(:all)  { DeferredGarbageCollection.reconsider }
  end
end
