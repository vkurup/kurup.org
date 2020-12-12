---
date: 2020-12-12T12:11:04
title: Advent of Code Elixir Day 1
categories:
- programming
- elixir
---

There's this cool thing called Advent of Code, described best
[here](https://adventofcode.com/2020/about). I found out about it while reading my
[favorite weekly
weblog](https://cpbotha.net/2020/12/12/weekly-head-voices-211-table-mountain-run-ish/)
and so I've decided to try my fledgling (maybe flailing is a better word?) Elixir skills
on it. There are 2 puzzles each day (`day_1_0` and `day_1_1` are my solutions). Here's
my code for Day 1:

```elixir
  @doc """
  Find 2 numbers in file that sum to 2020 and return their product.

      iex> Aoc.day_1_0()
      633216
  """
  def day_1_0 do
    goal = 2020
    list_of_nums = get_list_of_nums()

    first_num = find_first_partner(list_of_nums, goal)
    first_num * (goal - first_num)
  end

  @doc """
  Find 3 numbers in file that sum to 2020 and return their product.

      iex> Aoc.day_1_1()
      68348924
  """
  def day_1_1 do
    goal = 2020
    list_of_nums = get_list_of_nums()

    # find first number where there exists 2 other numbers that sum to `goal - x`
    first_num = Enum.find(list_of_nums, fn x -> find_first_partner(list_of_nums, goal - x) end)
    second_num = find_first_partner(list_of_nums, goal - first_num)

    first_num * second_num * (goal - first_num - second_num)
  end

  @doc """
  Given a `list` of integers, return the first number in that list which has a
  partner in the list that sums to `goal`.
  """
  def find_first_partner(list, goal) do
    Enum.find(list, fn x -> Enum.member?(list, goal - x) end)
  end

  defp get_file do
    Path.join("data", "day1.txt") |> File.read!()
  end

  defp get_list_of_nums do
    # Split into lines, filter out empty lines, convert each to an integer
    get_file()
    |> String.split("\n")
    |> Enum.filter(fn x -> String.trim(x) != "" end)
    |> Enum.map(&String.to_integer/1)
  end
```

The code is also available in Github, which I'll update if I do find time to keep going:
https://github.com/vkurup/aoc-elixir/

I feel like this could have been done more efficiently with recursion, but I am not
comfortable enough with recursion to know how...

A sincere thanks to [Eric Wastl](http://was.tl/) for spending the enormous time and energy
to create cool puzzles like this.
