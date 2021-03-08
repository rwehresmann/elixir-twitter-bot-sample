use Mix.Config

config :tweet, Tweet.Scheduler, jobs: [
  {"* * *", fn ->
    Tweet.FileReader.get_strings_to_tweet(
      Path.join("#{:code.priv_dir(:tweet)}", "sample.txt")
    )
    |> Tweet.TweetServer.tweet
  end}
]