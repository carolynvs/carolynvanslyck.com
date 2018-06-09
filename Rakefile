require "rubygems"

## -- Misc Configs -- ##

public_dir      = "_site"    # compiled site directory
source_dir      = "source"    # source file directory
blog_index_dir  = 'source/blog'    # directory for your blog's index page (if you put your index in source/blog/index.html, set this to 'source/blog')

desc "Compile sass"
task :sass do
  puts "## Compiling SASS"
  cd "_sass" do
    system "compass compile"
  end
end

desc "Build site"
task :build => [:sass] do
  puts "## Building site"
  system "jekyll build --verbose --future"
end

desc "Watch the site and regenerate when it changes"
task :serve => [:sass] do
  puts "Previewing site at http://0.0.0.0:4000"
  system "jekyll serve  --drafts --future --watch -H 0.0.0.0"
end

desc "list tasks"
task :list do
  puts "Tasks: #{(Rake::Task.tasks - [Rake::Task[:list]]).join(', ')}"
  puts "(type rake -T for more detail)\n\n"
end
