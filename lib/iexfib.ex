defmodule Iexfib do
  @moduledoc """
  This module is calculating Fibonacci numbers.
  """

  @doc """
  Fibonacci Calculation with Functional Programming

  ## Examples
    iex> Iexfib.fib
    {:ok, [1, 2, 3, 5, 7]}

    iex> Iexfib.fib(6)
    {:ok, [1, 2, 3, 5, 7, 12]}

    iex> Iexfib.fib(100, true)
    It took 0 MacroSeconds 0 Seconds 5 MicroSeconds
    {:ok, [354224848179261915075, 218922995834555169026, 135301852344706746049, ...]}
  """
  def fib(limit \\ 10, benchmark \\ false) do
    starting = :erlang.timestamp
    sol = case limit do
      0 -> IO.inspect {:ok, [0]}
      1 -> IO.inspect {:ok, [1]}
      2 -> IO.inspect {:ok, [1, 1]}
      n when n > 2 and n <= 100000 -> {:ok, calcfib(limit)}
      x when x < 0 -> {:error, "Number must be positive and smaller than 100000"}
      _ -> {:error, "Impossible operation."}
    end
    case benchmark do
      true ->
        {macss, secss, micss} = starting
        {macse, secse, micse} = :erlang.timestamp
        IO.puts "It took #{macse - macss} MacroSeconds #{secse - secss} Seconds #{micse - micss} MicroSeconds"
      _ -> ""
    end
    sol
  end

  @doc """
  Get the value of the nth number in the Fibonacci sequence

  ## Examples
    iex> Iexfib.grab_fib
    {:ok, 55}

    iex> Iexfib.grab_fib(6)
    {:ok, 8}

    iex> Iexfib.grab_fib(100, true)
    It took 0 MacroSeconds 0 Seconds 7 MicroSeconds
    {:ok, 354224848179261915075}
  """
  def grab_fib(num \\ 10, benchmark \\ false) do
    case fib(num, benchmark) do
      {:ok, x} ->
        [h|_] = x
        {:ok, h}
      {:error, x} ->
        x
    end
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
