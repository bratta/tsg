class Pages < Application
  # provides :xml, :yaml, :js

  before :ensure_authenticated, :only => [ :new, :edit, :create, :update, :delete ]

  def index
    @pages = Page.all
    display @pages
  end

  def show(id)
    @page = Page.get(id)
    raise NotFound unless @page
    display @page
  end

  def new
    only_provides :html
    @page = Page.new
    display @page
  end

  def edit(id)
    only_provides :html
    @page = Page.get(id)
    raise NotFound unless @page
    display @page
  end

  def create(page)
    @page = Page.new(page)
    if @page.save
      redirect resource(@page), :message => {:notice => "Page was successfully created"}
    else
      message[:error] = "Page failed to be created"
      render :new
    end
  end

  def update(id, page)
    @page = Page.get(id)
    raise NotFound unless @page
    if @page.update_attributes(page)
       redirect resource(@page)
    else
      display @page, :edit
    end
  end

  def delete(id)
    @page = Page.get(id)
    raise NotFound unless @page
    if @page.destroy
      redirect resource(:pages)
    else
      raise InternalServerError
    end
  end
end # Pages
