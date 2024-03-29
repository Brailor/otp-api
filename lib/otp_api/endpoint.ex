defmodule OtpApi.Endpoint do
  use Plug.Router

  plug(:match)

  plug(Plug.Parsers, parsers: [:json], pass: ["application/json"],
  json_decoder: Poison)

  plug(:dispatch)

  forward("/api", to: OtpApi.Router)

  match _ do
    send_resp(conn, 404, "Requested page not found!")
  end


  @spec child_spec(any()) :: %{id: OtpApi.Endpoint, start: {OtpApi.Endpoint, :start_link, [...]}}
  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(_opts) do
    Plug.Cowboy.http(__MODULE__, [])
  end
end
