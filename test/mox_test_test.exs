defmodule MoxTestTest do
  use ExUnit.Case

  import ExUnit.CaptureLog
  import Mox

  setup :verify_on_exit!
  setup _tags do
    Application.put_env(:mox_test, :user_service, MoxTest.UserServiceMock)

    :ok
  end

  @service_mock MoxTest.UserServiceMock

  describe "another_hello" do
    test "greets users when they are found" do
      expect @service_mock, :find_user, fn _ ->
        {:ok, "Mock"}
      end

      assert MoxTest.another_hello(user_service: @service_mock) == "Hello, Mock"
    end

    test "greets anonymous when there are no users" do
      expect @service_mock, :find_user, fn _ ->
        {:error, "not found"}
      end

      assert MoxTest.another_hello(user_service: @service_mock) ==
        "Hello, anonymous"
    end

    test "logs the failure" do
      expect @service_mock, :find_user, fn _ ->
        {:error, "not found"}
      end

      log = capture_log fn ->
        MoxTest.another_hello(user_service: @service_mock)
      end

      assert log =~ ~r/not found/
    end
  end

  describe "hello" do
    test "greets users when they are found" do
      expect @service_mock, :find_user, fn _ ->
        {:ok, "Mock"}
      end

      assert MoxTest.hello() == "Hello, Mock"
    end

    test "greets anonymous when there are no users" do
      expect @service_mock, :find_user, fn _ ->
        {:error, "not found"}
      end

      assert MoxTest.hello() == "Hello, anonymous"
    end

    test "logs the failure" do
      expect @service_mock, :find_user, fn _ ->
        {:error, "not found"}
      end

      log = capture_log fn ->
        MoxTest.hello()
      end

      assert log =~ ~r/not found/
    end
  end

  describe "try to expect" do
    test "the unexpected" do
      expect @service_mock, :destroy_user, fn ->
        :evil_laugh
      end

      @service_mock.destroy_user("root")
    end
  end
end
