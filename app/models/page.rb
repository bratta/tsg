class Page
  include DataMapper::Resource
  
  property :id, Serial

  property :title, String
  property :content, Text

  def self.navigation
    all(:order => [:id.asc])
  end
end
