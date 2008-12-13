class Page
  include DataMapper::Resource
  
  property :id, Serial

  property :title, String
  property :content, Text

end
