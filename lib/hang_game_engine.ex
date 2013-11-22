defmodule HangGameEngine do

  def guessed?(secret, tries) do
    spaceless_secret = :sets.del_element(32, :sets.from_list(secret))
    spaceless_secret == :sets.from_list(tries)
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

  def generate_secret(options) do
    #options = ['happy tree friends', 'how i met your mother', 'lost']
    n = :random.uniform(length options) - 1
    Enum.at(options, n)
  end
end
