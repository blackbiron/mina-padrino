require 'mina/padrino/core'

namespace :padrino do
  namespace :db do
    # ### padrino:db:migrate
    desc "Migrates the database."
    task :migrate do
      in_current_dir do
        queue %{
          echo "-----> Migrating database"
          #{echo_cmd %[#{rake} db:migrate]}
        }
      end
    end

    # ### padrino:db:create
    desc "Creates the database."
    task :create do
      in_current_dir do
        queue %{
          echo "-----> Creating database"
          #{echo_cmd %[#{rake} db:create]}
        }
      end
    end

    # ### padrino:db:drop
    desc "Drops the database."
    task :drop do
      in_current_dir do
        queue %{
          echo "-----> Dropping database!"
          #{echo_cmd %[#{rake} db:drop]}
        }
      end
    end

    # ### padrino:db:reset
    desc "Resets the database."
    task :reset do
      in_current_dir do
        queue %{
          echo "-----> Resetting database!"
          #{echo_cmd %[#{rake} db:reset]}
        }
      end
    end

    # ### padrino:db:setup
    desc "Setup the database."
    task :setup do
      in_current_dir do
        queue %{
          echo "-----> Setting up database"
          #{echo_cmd %[#{rake} db:setup]}
        }
      end
    end

    # ### padrino:db:setup
    desc "Seeds the database."
    task :seed do
      in_current_dir do
        queue %{
          echo "-----> Seeding database"
          #{echo_cmd %[#{rake} db:seed]}
        }
      end
    end
  end
end
