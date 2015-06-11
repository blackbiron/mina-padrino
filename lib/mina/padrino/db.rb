require 'mina/padrino/core'

namespace :padrino do
  namespace :db do
    # ### padrino:db:migrate
    desc "Migrates the database."
    task :migrate do
      queue %{
        echo "-----> Migrating database"
        #{echo_cmd %[#{rake} db:migrate]}
      }
    end

    # ### padrino:db:create
    desc "Creates the database."
    task :create do
      queue %{
        echo "-----> Creating database"
        #{echo_cmd %[#{rake} db:create]}
      }
    end

    # ### padrino:db:drop
    desc "Drops the database."
    task :drop do
      queue %{
        echo "-----> Dropping database!"
        #{echo_cmd %[#{rake} db:drop]}
      }
    end

    # ### padrino:db:reset
    desc "Resets the database."
    task :reset do
      queue %{
        echo "-----> Resetting database!"
        #{echo_cmd %[#{rake} db:reset]}
      }
    end

    # ### padrino:db:setup
    desc "Setup the database."
    task :setup do
      queue %{
        echo "-----> Setting up database"
        #{echo_cmd %[#{rake} db:setup]}
      }
    end

    # ### padrino:db:setup
    desc "Seeds the database."
    task :seed do
      queue %{
        echo "-----> Seeding database"
        #{echo_cmd %[#{rake} db:seed]}
      }
    end
  end
end
