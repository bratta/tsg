class Home < Application

  def index
    page = Page.first
    if page.nil?
      redirect(resource(:pages))
    else
      redirect(resource(Page.first))
    end
  end
  
end
