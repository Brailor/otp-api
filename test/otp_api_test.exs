defmodule OtpApiTest do
  use ExUnit.Case
  doctest OtpApi

  test "greets the world" do
    assert OtpApi.hello() == :world
  end
end
