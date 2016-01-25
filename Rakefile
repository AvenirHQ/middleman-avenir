
task default: %w[build]

desc 'Build the app'
task :build, :env do |t, args|
  args.with_defaults(:env => 'staging')
  env = args[:env]

  sh "CUSTOM_MIDDLEMAN_ENV=#{env} middleman build"
end

desc 'Deploy the app to S3'
task :deploy, :env do |t, args|
  require 'dotenv'

  args.with_defaults(:env => 'staging')
  env = args[:env]

  Dotenv.load(
    File.join(Dir.pwd, '.env'),
    File.join(Dir.pwd, ".env.#{env}")
  )

  aws_s3_bucket = ENV['AWS_S3_BUCKET']
  aws_s3_region = ENV['AWS_S3_REGION']
  aws_s3_profile = ENV['AWS_S3_PROFILE']
  # sync files using the upload profile
  #   from ./build to the correct bucket,
  #   deleting any old files,
  #   and adding the public-read acl to each file
  sh "aws s3 sync build s3://#{aws_s3_bucket} --region #{aws_s3_region} --delete --acl public-read --profile #{aws_s3_profile}"

  # a different method of doing this would be using https://github.com/alienfast/middleman-aws
  # which uses the aws gem for syncing a folder
  # the main improvement is that you don't need the aws cli or the profile installed
  #    instead you have environment variables that you can manage however you'd like

end

desc 'Develop the Site'
task :dev do
  sh 'CUSTOM_MIDDLEMAN_ENV=development middleman server'
end