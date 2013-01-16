namespace :md5app do
  task :run do
    Dir.mkdir('log') unless Dir.exists?('log')
    Dir.mkdir('log/md5app') unless Dir.exists?('log/md5app')
    file = File.new("log/md5app/#{Time.now.strftime("%Y%m%d%H%M%S")}.log", 'w+')
    Md5app::Md5Dir.new(Rails.root.to_s, file).build_tree
    file.close
  end
end
