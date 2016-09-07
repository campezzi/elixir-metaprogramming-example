defmodule Blogex.PostRenderer do
  posts_directory = "./posts"
  
  render_file = fn file ->
    "#{posts_directory}/#{file}"
    |> File.read!
    |> Earmark.to_html
    |> (&{:safe, &1}).()
  end

  posts_directory
  |> File.ls!
  |> Enum.each(fn file -> def render(unquote(file)), do: unquote(render_file.(file)) end)

  def render(_), do: raise(ArgumentError)
end
