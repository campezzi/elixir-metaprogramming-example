# Blogex

This is a fun experiment to demonstrate what can be achieved with the Elixir macro system. It's
a rudimentary blogging system - posts are simple Markdown files stored in the `posts` folder.

Visiting `/some_post_title` will eventually cause the `PageView` module to call
`PostRenderer.render("some_post_title.md")`. Now, here's the fun part - that function has been
defined with a macro in the `PostRenderer` module. At compile time, we go through every file in the
`posts` folder, render it to HTML, and then define a pattern-matched function that simply returns
the result of the render for the given filename. At runtime, calling the `render` function has
the performance cost of returning a constant (AKA blazing fast).

This silly example will just raise an error when trying to render a post that doesn't exist in the
`posts` folder, but you get my point. A quick note in case you try playing around with posts: when
you create a new post or modify an existing one, you'll need to stop the Phoenix server and run
`mix do clean, compile` so the macro gets a chance to run again. That could potentially be avoided
with the `@external_resource` module attribute, but I haven't tried using it.


## Running

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`
  * Visit [a sample blog post](http://localhost:4000/piping)
