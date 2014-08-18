Redmine::Plugin.register :company do
  name 'Company plugin'
  author 'Sukanta'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'


menu :top_menu, :company, {:controller => 'companies', :action => 'index', :project_id => nil}, :caption => "Company"

end
