defmodule MoxTest.UserServiceBehaviour do
  @callback find_user(String.t) :: {:ok, map()} | {:error, term}
end
