require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../models/shoe' )

class TestShoe < MiniTest::Test

  def setup
    @shoe = Shoe.new( {'first_name' => 'Krusty', 'last_name' =>'Clown', 'address' => '48 Evergreen Terrace, Springfield', 'size' => 11, 'quantity' => 365 })
  end

  def test_first_name()
    assert_equal( 'Krusty', @shoe.first_name() )
  end

  def test_second_name()
    assert_equal( 'Clown', @shoe.last_name() )
  end

  def test_full_name()
    assert_equal( 'Krusty Clown', @shoe.full_name() )
  end

  def test_size()
    assert_equal( 11, @shoe.size() )
    assert_equal(Fixnum, @shoe.size().class)
  end

  def test_quantity()
    assert_equal( Fixnum, @shoe.quantity().class )
    assert_equal( 365, @shoe.quantity() )
  end

end