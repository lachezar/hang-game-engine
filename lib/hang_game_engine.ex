defmodule HangGameEngine do

  def guessed?(secret, tries) do
    spaceless_secret = :sets.del_element(32, :sets.from_list(secret))
    :sets.is_subset(spaceless_secret, :sets.from_list(tries))
  end

  def currently_guessed(secret, tries) do
    tries_set = :sets.from_list(tries)
    lc s inlist secret do 
      if :sets.is_element(s, tries_set) or s == 32 do
        s
      else 
        '_'
      end
    end |> :binary.list_to_bin
  end

  def wrong_tryouts(secret, tries) do
    spaceless_secret = :sets.del_element(32, :sets.from_list(secret))
    tries_set = :sets.from_list(tries)
    :sets.subtract(tries_set, spaceless_secret) |> :sets.size
  end

  def generate_secret(options) do
    n = :crypto.rand_uniform(0, length options)
    Enum.at(options, n)
  end
end
