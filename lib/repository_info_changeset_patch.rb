module RepositoryInfoChangesetPatch
  def self.included(base)
    base.send(:extend, ClassMethods)
    base.send(:include, InstanceMethods)
    base.class_eval do
    end
  end
  
  module ClassMethods
  end
  
  module InstanceMethods
    def branches
      if repository.nil?
        return []        
      else
        return repository.scm.commit_branches(scmid)
      end
    end
  end
end

Changeset.send(:include, RepositoryInfoChangesetPatch)