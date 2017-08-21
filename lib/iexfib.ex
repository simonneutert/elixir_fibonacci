defmodule Iexfib do
  @moduledoc """
  This module is calculating Fibonacci numbers.
  """

  @doc """
  Fibonacci Calculation with Functional Programming

  ## Examples
      iex> Iexfib.fib
      [1, 2, 3, 5, 7]

      iex> Iexfib.fib(6)
      [1, 2, 3, 5, 7, 12]
  """
  def fib(limit \\ 10) do
    case limit do
      0 -> IO.inspect 0
      1 -> IO.inspect 1
      2 -> IO.inspect [1, 1]
      n when n > 2 and n < 100000 -> IO.inspect calcfib(limit)
      x when x < 0 -> IO.puts "Number must be positive and smaller than 100000"
      _ -> IO.puts "Impossible operation."
    end
  end

  @doc """
  Get the value of the nth number in the Fibonacci sequence

  ## Examples
      iex> Iexfib.grab_fib
      55

      iex> Iexfib.grab_fib(6)
      8
  """
  def grab_fib(num \\ 10) do
    [h|_] = calcfib(num)
    IO.inspect h
  end

  defp calcfib(limit, runs \\ 2, arr \\ [1, 1]) do
    cond do
      runs != limit ->
        [head|tail] = arr
        [h|_] = tail
        calcfib(limit, runs+1, [head+h|arr])
      runs == limit -> arr
    end
  end
end
