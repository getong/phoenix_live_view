defmodule Phoenix.LiveView.ChannelTest do
  alias Phoenix.LiveView.Channel
  use ExUnit.Case

  @doc false
  describe "find_files/3" do
    test "returns the path of the nested file" do
      params = %{
        "user" => %{
          "avatar" => %{
            "__PHX_FILE__" => "some_ref"
          },
          "other" => %{
            "__PHX_FILE__" => "some_other_ref"
          },
          "not_file" => "nil"
        }
      }

      assert Channel.find_files(params, "todo", nil) == [["user", "avatar"], ["user", "other"]]
    end
  end
end
