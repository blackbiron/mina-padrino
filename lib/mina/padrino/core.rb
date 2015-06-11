require 'mina/bundler'

# ## Settings
# Any and all of these settings can be overriden in your `deploy.rb`.

# ### padrino_env
# Sets the Padrino environment for `rake` and `padrino` commands.
#
# Note that changing this will NOT change the environment that your application
# is run in.

set_default :padrino_env, 'production'

# ### bundle_prefix
# Prefix for Bundler commands. Often to something like `RAILS_ENV=production
# bundle exec`.
#
#     queue! "#{bundle_prefix} annotate -r"

set_default :bundle_prefix, lambda { %{RACK_ENV="#{padrino_env}" #{bundle_bin} exec} }

# ### rake
# The prefix for `rake` commands. Use like so:
#
#     queue! "#{rake} db:migrate"

set_default :rake, lambda { %{#{bundle_prefix} rake} }

# ### padrino
# The prefix for `padrino` commands. Use like so:
#
#     queue! "#{padrino} console"

set_default :padrino, lambda { %{#{bundle_prefix} padrino } }

namespace :padrino do
  desc "Starts an interactive console."
  task :console => :environment do
    queue echo_cmd %[cd "#{deploy_to!}/#{current_path!}" && #{padrino} console && exit]
  end
end
