# Use an official Ruby image as the base
FROM ruby:3.3.5

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn libvips libvips-dev


# Set working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Install gems
RUN bundle install

# Copy the rest of the app code
COPY . /app

# Precompile assets for production
# RUN RAILS_ENV=production bundle exec rake assets:precompile

# Expose port 3000 to allow web traffic
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
