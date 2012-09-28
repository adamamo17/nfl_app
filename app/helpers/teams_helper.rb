module TeamsHelper

  def find_team (city)
    @game_id = 17;
    @count = 0;
    @json_object["gms"].each do |game|
      if game["h"] == city
        @game_id = @count
      elsif game["v"] == city
        @game_id = @count * -1
      end
      @count = @count + 1;
    end
    @game_id
  end

  def get_score(team)
    uri = URI.parse("http://www.nfl.com/liveupdate/scorestrip/ss.json")
    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Get.new(uri.request_uri)
    request["X-ApiKey"] = "InQu_g8rey_8kFDpvgb1m3CYvVySAKx6TE9jSHZoRThZdz0g"

    response = http.request(request)

    @json_object = JSON(response.body)

    city = team.abbrev.upcase

      @game = find_team (city)
      if @game > 0 && @game != 17
        @outcome = "#{@json_object["gms"][@game]["h"]} #{@json_object["gms"][@game]["hnn"]} #{@json_object["gms"][@game]["hs"]}, #{@json_object["gms"][@game]["v"]} #{@json_object["gms"][@game]["vnn"]} #{@json_object["gms"][@game]["vs"]}"
      elsif @game == 17
        @outcome = "BYE Week"
      else
        @outcome = "#{@json_object["gms"][@game * -1]["v"]} #{@json_object["gms"][@game * -1]["vnn"]} #{@json_object["gms"][@game * -1]["vs"]}, #{@json_object["gms"][@game * -1]["h"]} #{@json_object["gms"][@game * -1]["hnn"]} #{@json_object["gms"][@game * -1]["hs"]}"
      end

    @outcome
  end
end
