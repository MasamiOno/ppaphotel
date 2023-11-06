if defined?(AssetSync)
  AssetSync.configure do |config|
    config.fog_provider = 'AWS'
    config.fog_region = 'ap-northeast-1'
    config.aws_access_key_id = 'AKIAILAN4L2PEQCYW7TQ'
    config.aws_secret_access_key = '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'
    config.fog_directory = 'ppaphotel1'
    
    config.existing_remote_files = 'keep'
    
    config.gzip_compression = true
  end
end
