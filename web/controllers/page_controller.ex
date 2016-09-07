defmodule Blogex.PageController do
  use Blogex.Web, :controller

  def index(conn, _params) do
    text(conn, "Nothing to see here!")
  end

  def post(conn, %{"post" => post}) do
    render(conn, "post.html", post: post)
  end
end
