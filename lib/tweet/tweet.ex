defmodule Tweet.ExTweet do
  def send(str) do
    ExTwitter.configure(
      :process,
      [
        consumer_key: System.get_env("TWEETER_CONSUMER_KEY"),
        consumer_secret: System.get_env("TWEETER_CONSUMER_SECRET"),
        access_token_secret: System.get_env("TWEETER_ACCESS_TOKEN_SECRET"),
        access_token: System.get_env("TWEETER_ACCESS_TOKEN"),
      ]
    )

    ExTwitter.update(str)
  end
end