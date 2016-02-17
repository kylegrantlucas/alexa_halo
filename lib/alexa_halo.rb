require 'sinatra/extension'
require 'alexa_objects'
require 'halo_stats'


module Halo
  extend Sinatra::Extension

  helpers do
    def check_kill_death
      service_record = get_arena_service_record
      AlexaObjects::Response.new(spoken_response: "Your Kill Death Ratio is currently #{service_record["TotalKills"].to_f/service_record["TotalDeaths"].to_f}").to_json
    end

    def check_headshot
      service_record = get_arena_service_record
    end

    def last_match
    end

    def get_arena_service_record
      halo_stats_client.get_arena_service_record(settings.config.halo.gamertag)["Results"].first["Result"]["ArenaStats"]
    end

    def halo_stats_client
      @halo_stats_client ||= HaloStats::Stats.new(api_key: settings.config.halo.api_key)
    end

    def halo_metadata_client
      @halo_metadata_client ||= HaloStats::Metadata.new(api_key: settings.config.halo.api_key)
    end
  end
end
