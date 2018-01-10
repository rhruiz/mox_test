defmodule MoxTest.UserServiceBehaviour do
  @callback find_user(String.t) :: {:ok, map()} | {:error, term}

  def find_user(_name), do: {:error, :not_implemented}
end
