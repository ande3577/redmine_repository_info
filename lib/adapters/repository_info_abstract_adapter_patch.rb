module AbstractAdapterPatch
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
      []
    end
  end
end

Redmine::Scm::Adapters::AbstractAdapter.send(:include, AbstractAdapterPatch)