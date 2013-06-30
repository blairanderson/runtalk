desc "this starts our message recorder"
task :recorder => :environment do 
  puts 'starting the message recorder'
  MessageRecorder.listen
  puts 'done'
end
