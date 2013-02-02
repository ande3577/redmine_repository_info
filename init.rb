require 'redmine'

require_dependency 'repository_info_changeset_patch'
require_dependency 'adapters/repository_info_abstract_adapter_patch'
require_dependency 'adapters/repository_info_git_adapter_patch'

Redmine::Plugin.register :redmine_repository_info do
  name 'Redmine Git Branch plugin'
  author 'David S Anderson'
  description 'Displaying additional repository info when displaying commits.'
  version '0.0.2'
  url 'https://github.com/ande3577/redmine_repository_info'
  author_url 'https://github.com/ande3577/'
end
