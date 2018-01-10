defmodule MoxTest.UserService do
  @behaviour MoxTest.UserServiceBehaviour

  def find_user(_name), do: {:error, :not_implemented}
end
