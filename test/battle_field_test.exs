defmodule Battleest do
  use ExUnit.Case

  import TicTacToe.Field

  test "check_who_win test" do
    assert {:win, :x} == check_who_win({{:x, :x, :x}, {:f, :f, :o}, {:f, :f, :o}})
    assert {:win, :o} == check_who_win({{:f, :x, :f}, {:o, :o, :o}, {:x, :f, :f}})
    assert {:win, :x} == check_who_win({{:f, :o, :f}, {:o, :f, :f}, {:x, :x, :x}})
    assert {:win, :o} == check_who_win({{:o, :x, :f}, {:o, :f, :x}, {:o, :f, :f}})
    assert {:win, :x} == check_who_win({{:f, :x, :o}, {:p, :x, :f}, {:f, :x, :f}})
    assert {:win, :o} == check_who_win({{:f, :x, :o}, {:f, :x, :o}, {:f, :f, :o}})
    assert {:win, :x} == check_who_win({{:x, :f, :o}, {:o, :x, :f}, {:f, :f, :x}})
    assert {:win, :o} == check_who_win({{:f, :f, :o}, {:x, :o, :f}, {:o, :x, :f}})

    assert :draw == check_who_win({{:x, :x, :o}, {:o, :o, :x}, {:x, :x, :o}})

    assert :no_win == check_who_win({{:x, :f, :f}, {:f, :x, :x}, {:f, :f, :o}})
    assert :no_win == check_who_win({{:x, :o, :o}, {:o, :x, :x}, {:x, :o, :f}})
  end

  test "add move to field test" do
    field = {{:f, :x, :o}, {:o, :f, :f}, {:x, :f, :f}}

    assert {:ok, {{:f, :x, :o}, {:o, :f, :f}, {:x, :f, :x}}} == make_move(field, 9, :x)
    assert {:ok, {{:f, :x, :o}, {:o, :x, :f}, {:x, :f, :f}}} == make_move(field, 5, :x)
    assert {:ok, {{:o, :x, :o}, {:o, :f, :f}, {:x, :f, :f}}} == make_move(field, 1, :o)

    assert {:error, :impossible_move} == make_move(field, 4, :x)
    assert {:error, :impossible_move} == make_move(field, 7, :x)

    assert {:error, :wrong_cell_number} == make_move(field, 10, :x)
    assert {:error, :wrong_cell_number} == make_move(field, 0, :x)
  end

  test "draw field test" do
    assert "   |   |   \n   |   |   \n   |   |   \n" ==
             draw_field({{:f, :f, :f}, {:f, :f, :f}, {:f, :f, :f}})

    assert "   | x | o \n o |   |   \n x |   | x \n" ==
             draw_field({{:f, :cross, :zero}, {:zero, :f, :f}, {:cross, :f, :cross}})
  end
end
