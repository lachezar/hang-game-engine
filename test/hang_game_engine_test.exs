defmodule HangGameEngineTest do
  use ExUnit.Case

  import HangGameEngine

  test "guessed entire secret" do
    assert partial_guess('happy tree friends', 'hapytrefinds') == "happy tree friends"
  end

  test "partially guessed secret" do
    assert partial_guess('happy tree friends', 'haptre') == "happ_ tree _r_e___"
  end

  test "not guessed at all" do
    assert partial_guess('happy tree friends', '') == "_____ ____ _______"
  end

  test "guessed?" do
    assert guessed?('happy', 'hapxzjk') == false
    assert guessed?('happy tree friends', 'hapx') == false
    assert guessed?('happy tree friends', 'hapxytrefinds') == true
  end

  test "generate secret" do
    assert random_element(["a"]) == "a"
  end

  test "count wrong tryouts" do
    assert incorrect_attempts('happy tree', 'jhapqwer') == 3
    assert incorrect_attempts('happy tree', 'qwzxl') == 5
    assert incorrect_attempts('happy tree', 'hap') == 0
  end

  test "ordered unique list should perserve the order" do
    assert ordered_uniqueue_list('ytreyyyyttreqweqwwq') == 'ytrewq'
    assert ordered_uniqueue_list('') == ''
    assert ordered_uniqueue_list('aaaaa') == 'a'
  end

  test "giphy search" do
    :hackney.start
    assert is_bitstring search_giphy("star trek")
    assert nil? search_giphy("random_text_here_with_0_results")
  end
end
