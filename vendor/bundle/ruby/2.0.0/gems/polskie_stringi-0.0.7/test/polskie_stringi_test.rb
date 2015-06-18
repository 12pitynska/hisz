# encoding: utf-8

require 'test_helper'

class PolskieStringiTest < ActiveSupport::TestCase
  test "upcase" do
    assert "ąęae12EĄ.".upcase, "ĄĘAE12EĄ."
  end

  test "downcase" do
    assert "ĄĘAE12eą.".downcase, "ąęae12eą."
  end

  test "cpitalize" do
    assert "aDśĆv1.".capitalize, "Adśćv1."
    assert "óDśĆv1.".capitalize, "Ódśćv1."
  end

  test "no_pl" do
    assert "ĄĘAE12eąść.".downcase, "AEAE12easc."
  end
end
