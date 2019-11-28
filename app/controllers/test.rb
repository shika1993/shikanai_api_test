class TrainAPI 
  BASE_URL = 'https://api-tokyochallenge.odpt.org/api/v4/odpt:'
  CONSUMER_KEY= 'キー''
  def self.make_get_request(path, params)
    url = BASE_URL + path
    @conn = Faraday.new(url)
    res = @conn.get do |req|
      
      req.params['acl:consumerKey'] = CONSUMER_KEY
      params.each do |key, value|
      req.params[key] = value
      end
    end
    return JSON.parse(res.body)
  end
end

class StationAPI < TrainAPI
  PATH = 'Station'
  def self.fetch(params)
    make_get_request(PATH, params)
  end
end

def index
  @jr_stations = StationAPI.fetch({'odpt:operator': 'odpt.Operator:JR-East'})
  @keio_stations = StationAPI.fetch({'odpt:operator': 'odpt.Operator:Keio'})
end