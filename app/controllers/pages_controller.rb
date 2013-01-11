class PagesController < ApplicationController
  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all

    # Forward @page so that creation form can be rendered properly in index view
    @page  = Page.new
    
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])

    # Forward Json facebook reply as a @feeds object to display it in view
    @feeds = Page.getFacebookFeeds(@page.page_id)

  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])
    @pages = Page.all

    @page.name = Page.getFacebookPage(@page.page_id)['name']

    respond_to do |format|
      if @page.save
        format.html { redirect_to pages_url, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "index" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])
    @pages = Page.all

    @page.name = Page.getFacebookPage(params[:page][:page_id])['name']

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to pages_url, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end
end
