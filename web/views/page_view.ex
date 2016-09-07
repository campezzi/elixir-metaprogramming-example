defmodule Blogex.PageView do
  use Blogex.Web, :view
  alias Blogex.PostRenderer

  def render("post.html", %{post: post}) do
    PostRenderer.render("#{post}.md")
  end
end
