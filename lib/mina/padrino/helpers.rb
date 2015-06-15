module Mina
  module Helpers
    def in_current_dir(&block)
      in_directory("#{deploy_to!}/#{current_path!}",&block)
    end
  end
end
