defmodule HangGameEngineTest do
  use ExUnit.Case

  import HangGameEngine

  test "guessed entire secret" do
    assert currently_guessed('happy tree friends', 'hapytrefinds') == "happy tree friends"
  end

  test "partially guessed secret" do
    assert currently_guessed('happy tree friends', 'haptre') == "happ_ tree _r_e___"
  end

  test "not guessed at all" do
    assert currently_guessed('happy tree friends', '') == "_____ ____ _______"
  end

  test "guessed?" do
    assert guessed?('happy', 'hapxzjk') == false
    assert guessed?('happy tree friends', 'hapx') == false
    assert guessed?('happy tree friends', 'hapxytrefinds') == true
  end

  test "generate secret" do
    assert generate_secret(['a']) == 'a'
  end

  test "count wrong tryouts" do
    assert wrong_tryouts('happy tree', 'jhapqwer') == 3
    assert wrong_tryouts('happy tree', 'qwzxl') == 5
    assert wrong_tryouts('happy tree', 'hap') == 0
  end
end
