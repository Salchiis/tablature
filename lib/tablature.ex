defmodule Tablature do
  def parse(tab) do
    tab
    |> String.split()
    |> Enum.map(fn line -> parse_line(line) end)
    |> List.flatten()
    |> Enum.sort_by(fn {_c, p} -> p end)
    |> Enum.map(fn {c, _p} -> c end)
    # Concatena todas las cadenas y usa espacio vacio como seaprador
    |> Enum.join(" ")

    # |> String.trim()
    # |> Enum.filter(fn lista -> lista != [] end)
    # |> Enum.zip()
    # |> Enum.map(fn tupla -> Tuple.to_list(tupla) end)
    # |> List.flatten()
    # |> Enum.join(" ")
  end

  def parse_line(line) do
    note = String.at(line, 0)

    String.graphemes(line)
    |> Enum.with_index()
    |> Enum.filter(fn tupla -> elem(tupla, 0) =~ ~r/\d/ end)
    |> Enum.map(fn {c, p} -> {note <> c, p} end)
  end
end
