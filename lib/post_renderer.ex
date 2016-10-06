defmodule Blogex.PostRenderer do
  require Blogex.PrismRenderer
  alias Earmark.Options

  posts_directory = "./posts"

  render_file = fn file ->
    "#{posts_directory}/#{file}"
    |> File.read!
    |> Earmark.to_html(%Options{renderer: Blogex.PrismRenderer})
    |> (&{:safe, &1}).()
  end

  posts_directory
  |> File.ls!
  |> Enum.map(&Task.async(fn -> def render(unquote(&1)), do: unquote(render_file.(&1)) end))
  |> Enum.map(&Task.await(&1))

  def render(_), do: raise(ArgumentError)
end
