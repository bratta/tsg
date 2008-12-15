class Home < Application

  def index
    redirect(resource(Page.first))
  end
  
end
