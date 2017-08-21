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
    IO.inspect calcfib(limit)
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

  defp calcfib(limit, comps \\ 2, arr \\ [1, 1]) do
    cond do
      comps == limit -> arr
      comps != limit ->
        [head|tail] = arr
        [h|_] = tail
        calcfib(limit, comps+1, [head+h|arr])
    end
  end
end
