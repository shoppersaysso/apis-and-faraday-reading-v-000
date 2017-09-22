class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'XJFAG2X3JXZ5GSSN52SWFLV2PGH2GPB0VNPSSAHBZRFHXR21'
      req.params['client_secret'] = 'E14TV0XHIQOCOYSWXIORH440G0FHLVANU0AAG1ROMJYZWEUD'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end
