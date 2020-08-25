unless Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
        config.fog_provider = 'fog-aws'
        config.fog_credentials = {
            provider: 'AWS',
            aws_access_key_id: 'AKIAZBMOZJ7VIZNG3AQQ',
            aws_secret_access_key: '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',
            region: 'ap-northeast-1'
}

    config.fog_directory  = 'sharecolor-s3'
    config.cache_storage = :fog
    end
end