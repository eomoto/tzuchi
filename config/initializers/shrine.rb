require "shrine"
require "shrine/storage/google_drive_storage"

Shrine.storages = {
  store: Shrine::Storage::GoogleDriveStorage.new,
  cache: Shrine::Storage::GoogleDriveStorage.new,
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :rack_file # for non-Rails apps