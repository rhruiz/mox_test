defmodule MoxTest do
  @moduledoc """
  Documentation for MoxTest.
  """

  @user_service Application.get_env(:mox_test, :user_service)

  @doc """
  Hello world.

  ## Examples

      iex> MoxTest.hello
      :world

  """
  def hello do
    "root" |> @user_service.find_user() |> greet()
  end

  def another_hello(opts \\ []) do
    service = Keyword.get(opts, :user_service, MoxTest.UserService)

    "root" |> service.find_user() |> greet()
  end

  defp greet(maybe_user) do
    case maybe_user do
      {:ok, user} -> "Hello, #{user}"
      {:error, reason} ->
        require Logger
        Logger.warn "Failed to find user: #{inspect(reason)}"
        "Hello, anonymous"
    end
  end
end
