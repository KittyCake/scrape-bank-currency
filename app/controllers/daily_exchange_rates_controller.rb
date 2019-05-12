class DailyExchangeRatesController < ApplicationController
  before_action :set_daily_exchange_rate, only: [:show, :edit, :update, :destroy]

  # GET /daily_exchange_rates
  # GET /daily_exchange_rates.json
  def index
    @daily_exchange_rates = DailyExchangeRate.all

    # @exchanges = scrape_citic
    # byebug
    # respond_to do |format|
    #   format.xlsx { render xlsx: "download", filename: "citic_exchange_rate.xlsx" }
    # end

    # render xlsx: "index", filename: "citic_exchange_rate.xlsx"
  # respond_to do |format|
  #   format.xlsx
  # end
end

  # GET /daily_exchange_rates/1
  # GET /daily_exchange_rates/1.json
  def show
  end

  # GET /daily_exchange_rates/new
  def new
    @daily_exchange_rate = DailyExchangeRate.new
  end

  # GET /daily_exchange_rates/1/edit
  def edit
  end

  # POST /daily_exchange_rates
  # POST /daily_exchange_rates.json
  def create
    @daily_exchange_rate = DailyExchangeRate.new(daily_exchange_rate_params)

    respond_to do |format|
      if @daily_exchange_rate.save
        format.html { redirect_to @daily_exchange_rate, notice: 'Daily exchange rate was successfully created.' }
        format.json { render :show, status: :created, location: @daily_exchange_rate }
      else
        format.html { render :new }
        format.json { render json: @daily_exchange_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_exchange_rates/1
  # PATCH/PUT /daily_exchange_rates/1.json
  def update
    respond_to do |format|
      if @daily_exchange_rate.update(daily_exchange_rate_params)
        format.html { redirect_to @daily_exchange_rate, notice: 'Daily exchange rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_exchange_rate }
      else
        format.html { render :edit }
        format.json { render json: @daily_exchange_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_exchange_rates/1
  # DELETE /daily_exchange_rates/1.json
  def destroy
    @daily_exchange_rate.destroy
    respond_to do |format|
      format.html { redirect_to daily_exchange_rates_url, notice: 'Daily exchange rate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
    @exchanges = scrape_citic
    respond_to do |format|
      # byebug
      format.xlsx { render xlsx: "download", filename: "中信銀行外匯牌價_#{Date.today}.xlsx" }
    end

  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_exchange_rate
      @daily_exchange_rate = DailyExchangeRate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_exchange_rate_params
      params.require(:daily_exchange_rate).permit(:date)
    end

    def scrape_citic
      require 'open-uri'
      # 中信
      url = 'http://www.citicbank.com/common/financialnews/news/201606/t20160608_56604.html'
      # json
      # url = 'https://etrade.citicbank.com/portalweb/cms/getForeignExchRate.htm'

      doc = Nokogiri::HTML(open(url))
      scripts = doc.css('script').map(&:text)

      json_url = scripts.select{ |s| s['table'] }[0].match(/https(...)*htm/)[0]

      
      exchanges_pack = open(json_url).read
      exchanges = JSON.parse(exchanges_pack)['content']['resultList']
      exchanges
    end
    
end
