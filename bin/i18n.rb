require 'slop'
require 'file_loading'
require 'hash_addition'
require 'locale_file_iteration'

opts = Slop.parse do
  on '-v', 'Print the version' do
    puts "Version 1.0"
  end

  command 'add' do
    on :v, :verbose, 'Enable verbose mode'
    on :name=, 'Your name'

    run do |opts, args|
      puts "You ran 'add' with options #{opts.to_hash} and args: #{args.inspect}"
    end
  end
end