class Sites::Settings::PagesController < Sites::Settings::ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = @site.pages.all
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)
    @page.site = @site

    respond_to do |format|
      if @page.save
        format.html { redirect_to [@site, @page], notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: [@site, @page] }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = @site.pages.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :content)
    end
end
