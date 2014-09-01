class LinksController < ApplicationController
  before_action :set_link, only: [:show, :send_text_message]

  # GET /links/1
  # GET /links/1.json
  def show
    if params[:confirm_code].present?
      if params[:confirm_code] == @link.confirm_code
        link = open(@link.s3_url.url)
        send_data(link.read)
        @link.s3_url.destroy
        @link.destroy
        # DestroyLink.perform_async(@link.id)
      end
    end
  end
  
  def send_text_message
    twilio = TwilioApi.new
    twilio.text_confirmation(@link)
  end
  
  def about
  end

  # GET /links/new
  def new
    @link = Link.new
  end
  
  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        LinkMailer.email_link(@link).deliver
        format.html { redirect_to root_url, notice: 'Link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:s3_url, :email, :user_id)
    end
end
