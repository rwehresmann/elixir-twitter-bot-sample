defmodule FileReaderTest do
  use ExUnit.Case
  import Tweet.FileReader
  import Mock

  doctest Tweet.FileReader
  test "Passing a file should return a string" do
    str = get_strings_to_tweet(
      Path.join("#{:code.priv_dir(:tweet)}", "sample.txt")
    )

    assert str != nil
  end

  test "Will not return a string longer than 140 characters" do
    str = get_strings_to_tweet(
      Path.join("#{:code.priv_dir(:tweet)}", "/test/too_long.txt")
    )

    assert str == "short text"
  end

  test "An empty string should return an empty string" do
    with_mock File, [read!: fn(_) -> "" end] do
      str = get_strings_to_tweet("file.txt")
      assert str == ""
    end
  end

  test "The string should be trimmed" do
    with_mock File, [read!: fn(_) -> " ABC " end] do
      str = get_strings_to_tweet("missing_file.txt")

      assert str == "ABC"
    end
  end
end