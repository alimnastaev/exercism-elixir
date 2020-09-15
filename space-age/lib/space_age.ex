defmodule SpaceAge do
  @earth_year_in_sec 31557600

  @planets [
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  ]

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  def age_on(planet, seconds) when planet == :earth, do: seconds / @earth_year_in_sec

  def age_on(planet, seconds) do
      seconds / (@earth_year_in_sec * Keyword.get(@planets, planet))
  end
end
