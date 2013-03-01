module GitAdapterPatch
  def self.included(base)
    base.send(:extend, ClassMethods)
    base.send(:include, InstanceMethods)
    base.class_eval do
    end
  end
  
  module ClassMethods
  end
  
  module InstanceMethods
    def commit_branches(id)
      begin
        @commit_branches = []
        cmd_args = %w|branch --no-color --verbose --no-abbrev|
        cmd_args << "--contains=#{id}"
        git_cmd(cmd_args) do |io|
          io.each_line do |line|
            branch_rev = line.match('\s*(\*?)\s*(.*?)\s*([0-9a-f]{40}).*$')
            bran = branch_rev[2]
            @commit_branches << bran
          end
        end
        @commit_branches.sort!
      rescue
        @commit_branches = []
      end
      return @commit_branches 
    end
  end
end

Redmine::Scm::Adapters::GitAdapter.send(:include, GitAdapterPatch)