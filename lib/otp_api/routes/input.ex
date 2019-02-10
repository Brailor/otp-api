defmodule OtpApi.Input do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  post "/test" do
    conn
      |> put_resp_content_type("application/json")
      # have the body params here in the body_params proprerty in 'conn'
      |> normalize_data
      |> send_resp(200, Poison.encode!(message()))
  end

def normalize_data (conn) do
  IO.inspect(conn.body_params["result"])
  conn
end

  defp message do
    %{
      response_type: "in_channel",
      text: "Hello from BOT!! :)"
    }
  end
end
