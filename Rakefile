require "rubygems"
require "bundler/setup"

# This will be configured for you when you run config_deploy
deploy_branch  = "master"

## -- Misc Configs -- ##

public_dir      = "_site"    # compiled site directory
source_dir      = "source"    # source file directory
blog_index_dir  = 'source/blog'    # directory for your blog's index page (if you put your index in source/blog/index.html, set this to 'source/blog')
deploy_dir      = "_deploy"   # deploy directory (for Github pages deployment)d

desc "Generate Site"
task :build do
  system "jekyll build"
end

desc "Preview Site"
task :serve do
  system "jekyll serve"
end

desc "Deploy to GitHub Pages"
task :deploy => [:build] do
  # Check if preview posts exist, which should not be published
  if !File.exists?(deploy_dir)
    puts "## Setting up deploy directory"
    Rake::Task[:setup_deploy].execute
  end

  Rake::Task[:copydot].invoke(source_dir, public_dir)
  Rake::Task[:push].execute
end

desc "copy dot files for deployment"
task :copydot, :source, :dest do |t, args|
  FileList["#{args.source}/**/.*"].exclude("**/.", "**/..", "**/.DS_Store", "**/._*").each do |file|
    cp_r file, file.gsub(/#{args.source}/, "#{args.dest}") unless File.directory?(file)
  end
end

desc "deploy public directory to github pages"
multitask :push do
  puts "## Deploying branch to Github Pages "
  puts "## Pulling any updates from Github Pages "
  cd "#{deploy_dir}" do
    system "git fetch origin"
    system "git reset --hard origin/master"
  end

  (Dir["#{deploy_dir}/*"]).each { |f| rm_rf(f) }
  Rake::Task[:copydot].invoke(public_dir, deploy_dir)
  puts "\n## Copying #{public_dir} to #{deploy_dir}"
  cp_r "#{public_dir}/.", deploy_dir
  cd "#{deploy_dir}" do
    system "git add -A"
    puts "\n## Commiting: Site updated at #{Time.now.utc}"
    message = "Site updated at #{Time.now.utc}"
    system "git commit -m \"#{message}\""
    puts "\n## Pushing generated #{deploy_dir} website"
    system "git push origin #{deploy_branch}"
    puts "\n## Github Pages deploy complete"
  end
end

desc "Set up _deploy folder and deploy branch for Github Pages deployment"
task :setup_deploy do |t, args|
  repo_url = system "git remote get-url origin"

  rm_rf deploy_dir
  mkdir deploy_dir
  cd "#{deploy_dir}" do
    system "git clone #{repo_url} --branch #{deploy_branch} ."
  end
  puts "\n---\n## Now you can deploy to #{repo_url} with `rake deploy` ##"
end

desc "list tasks"
task :list do
  puts "Tasks: #{(Rake::Task.tasks - [Rake::Task[:list]]).join(', ')}"
  puts "(type rake -T for more detail)\n\n"
end
