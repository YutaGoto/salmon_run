Dir[Rails.root.join('lib/extend/*.rb')].sort.each { |l| require l }
