defmodule SurroundingTest do
  use ExUnit.Case

  @board [{0,[0,0,0,0]},
    	  {1,[0,0,0,0]},
	  {2,[0,0,0,0]},
	  {3,[0,0,0,0]}
      ]

  test "recognize corner" do
    assert Surrounding.get_surrounding(@board,{0,0}) == [0,0,0]
  end

  test "recoginze first row" do
    assert Surrounding.get_surrounding(@board,{1,0}) == [0,0,0,0,0]
  end

  test "recognize last row" do
    assert Surrounding.get_surrounding(@board,{3,2}) == [0,0,0,0,0]
  end


  test "recognize first column" do
    assert Surrounding.get_surrounding(@board,{0,2}) == [0,0,0,0,0]  
  end

  test "recognize last column" do
    assert Surrounding.get_surrounding(@board,{0,3}) == [0,0,0]  
  end
end