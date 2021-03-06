defmodule Surrounding do

  def get_surrounding(board,{x,y}) do
    # Alle Positionen von x-1,y-1 bis x+1,y+1 werden durchsucht
    # alle x-1 bis x+1 durchlaufen, innerhalb dieser durchlaufe wieder alle Unterpositionen auswerten

    filtered_rows = Enum.filter(board,fn({position,column})-> 
          check_position_range(y,position)
        end)
    
    get_surrounding_row(filtered_rows,{x,y},[])
  end

  @doc """
  hier wird zuerst durch alle y ebenen gesteppt
  und innerhalb dieser durch alle x-Positionen
  """
  defp get_surrounding_row([head|tail],{x,y},result_list) do
    #IO.puts "--------------------"
    #IO.puts elem(head,0)
    
    column = elem(head,1)
    result_list = column_stepper(column,{x,y},[],0,elem(head,0)) ++ result_list
    get_surrounding_row(tail,{x,y},result_list)
  end

  @doc """
   wir sind am Ende angelangt
  """
  defp get_surrounding_row([],{x,y},result_list) do
    result_list
  end

  defp column_stepper([head|tail],{x,y},result_list,positionX,positionY) do
    #IO.puts "===================="
    #IO.puts positionX
    if check_position({x,y},{positionX,positionY}) do
      result_list = [head] ++ result_list
    end

    column_stepper(tail,{x,y},result_list,positionX+1,positionY)
  end

  defp column_stepper([],{x,y},result_list,positionX,positionY) do 
    result_list  
  end

  defp check_position({point_x,point_y},{position_point_x,position_point_y}) do
    (point_x != position_point_x or
    point_y != position_point_y )and
    check_position_range(point_x,position_point_x)
  end

  defp check_position_range(center, position) do
    center-1<=position and center+1>=position
  end

end