defmodule HangGameEngineTest do
  use ExUnit.Case

  test "guessed entire secret" do
    assert HangGameEngine.currently_guessed('happy tree friends', 'hapytrefinds') == "happy tree friends"
  end

  test "partially guessed secret" do
    assert HangGameEngine.currently_guessed('happy tree friends', 'haptre') == "happ_ tree _r_e___"
  end

  test "not guessed at all" do
    assert HangGameEngine.currently_guessed('happy tree friends', '') == "_____ ____ _______"
  end

  test "guessed?" do
    assert HangGameEngine.guessed?('happy', 'hap') == false
    assert HangGameEngine.guessed?('happy tree friends', 'hap') == false
    assert HangGameEngine.guessed?('happy tree friends', 'hapytrefinds') == true
  end

  test "generate secret" do
    assert HangGameEngine.generate_secret(['a']) == 'a'
  end
end
