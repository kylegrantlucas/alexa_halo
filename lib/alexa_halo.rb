require 'sinatra/extension'
require 'alexa_objects'
require 'halo_stats'


module Halo
  extend Sinatra::Extension

  helpers do
    # TODO: Change to new intent name
    def check_halo_stats
      gamertag = settings.config.gamertag 
      api_key = settings.config.api_key
      stats_client = HaloStats::Stats.new(api_key: api_key)
      metadata_client = HaloStats::Metadata.new(api_key: api_key)
      profile_client = HaloStats::Profile.new(api_key: api_key)
    end
  end
end
