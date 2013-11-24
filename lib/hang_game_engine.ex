defmodule HangGameEngine do

  def guessed?(secret, tries) do
    spaceless_secret = HashSet.new(secret) |> Set.delete(32)
    Set.subset?(spaceless_secret, HashSet.new(tries))
  end

  def currently_guessed(secret, tries) do
    tries_set = HashSet.new(tries)
    lc s inlist secret do 
      if HashSet.member?(tries_set, s) or s == 32 do
        s
      else 
        '_'
      end
    end |> list_to_bitstring
  end

  def wrong_tryouts(secret, tries) do
    spaceless_secret = HashSet.new(secret) |> Set.delete(32)
    tries_set = HashSet.new(tries)
    Set.difference(tries_set, spaceless_secret) |> Set.size
  end

  def generate_secret(options) do
    n = :crypto.rand_uniform(0, length options)
    Enum.at(options, n)
  end

  def ordered_uniqueue_list([h | t], r // [], s // HashSet.new) do
    if not Set.member?(s, h) do
      s = Set.put(s, h)
      r = [h | r]
    end
    ordered_uniqueue_list(t, r, s)
  end

  def ordered_uniqueue_list([], r, _s) do
    Enum.reverse(r)
  end
end

