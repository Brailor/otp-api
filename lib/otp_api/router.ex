defmodule OtpApi.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  forward("/input", to: OtpApi.Input)

end
