module Kernel
  def r
    reload!
  end
end

require 'pry'
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 300
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
