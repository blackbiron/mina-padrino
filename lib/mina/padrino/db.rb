require 'mina/padrino/core'

namespace :padrino do
  namespace :db do
    # ### padrino:db:migrate
    desc "Migrate the database to the latest version"
    task :migrate do
      in_current_dir do
        queue %{
          echo "-----> Migrating database"
          #{echo_cmd %[#{rake} db:migrate]}
        }
      end
    end

    namespace :migrate do
      desc "Migrate down using migrations"
      task :down, [:version] do
        task_arg = if args[:version]
                     "[#{args[:version]}]"
                   end

        in_current_dir do
          queue %{
            echo "-----> Migrating database down"
            #{echo_cmd %[#{rake} db:migrate:down#{task_arg}]}
          }
        end
      end

      desc "Migrate up using migrations"
      task :up, [:version] do |t,args|
        task_arg = if args[:version]
                     "[#{args[:version]}]"
                   end

        in_current_dir do
          queue %{
            echo "-----> Migrating database up"
            #{echo_cmd %[#{rake} db:migrate:up#{task_arg}]}
          }
        end
      end
    end

    # ### padrino:db:create
    desc "Creates the database"
    task :create do
      in_current_dir do
        queue %{
          echo "-----> Creating database"
          #{echo_cmd %[#{rake} db:create]}
        }
      end
    end

    # ### padrino:db:drop
    desc "Drop the database (postgres and mysql only)"
    task :drop do
      in_current_dir do
        queue %{
          echo "-----> Dropping database!"
          #{echo_cmd %[#{rake} db:drop]}
        }
      end
    end

    # ### padrino:db:reset
    desc "Drop the database, migrate from scratch and initialize with the seed data"
    task :reset do
      in_current_dir do
        queue %{
          echo "-----> Resetting database!"
          #{echo_cmd %[#{rake} db:reset]}
        }
      end
    end

    # ### padrino:db:setup
    desc "Create the database migrate and initialize with the seed data"
    task :setup do
      in_current_dir do
        queue %{
          echo "-----> Setting up database"
          #{echo_cmd %[#{rake} db:setup]}
        }
      end
    end

    # ### padrino:db:setup
    desc "Load the seed data from db/seeds.rb"
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
