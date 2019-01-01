Dir[Rails.root.join('lib', 'extend', '*.rb')].each { |l| require l }
