defmodule BankAccountWeb.Router do
  use BankAccountWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BankAccountWeb do
    pipe_through :api
  end
end
