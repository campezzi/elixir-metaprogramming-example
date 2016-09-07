# Piping into anonymous functions

Has this ever happened to you?

```elixir
"Pipe all the things!"
|> String.upcase
|> String.reverse
|> # ...I can't find a function that does what I need!
```

Don't worry, it happens to the best of us. The usual solution is to define a private function that
does what you need to do and carry on. There are times, however, where that doesn't feel right. For
example, say the step missing from the sequence of operations above is putting the resulting
string in the `:result` key of a new `Map`. This function seems way too specific to be useful
elsewhere:

```elixir
defp to_result_map(string) do
  %{result: string}
end
```

Fortunately, steps of a sequence of piped operations are just functions - which means you can pipe
values into _anonymous functions_. While this is obvious from a logical perspective, the syntax
is not entirely intuitive. Here's how you do it:

```elixir
"Pipe all the things!"
|> String.upcase
|> String.reverse
|> (fn str -> %{result: str} end).()
```

That does the job and it's still pretty readable. If you're feeling brave and don't mind sacrificing
a bit of readability for brevity, you can replace the last line with the shorthand version:

```elixir
|> (&%{result: &1}).()
```

Another advantage is that anonymous functions are closures, so they have access to other variables
defined in the scope where all the piping is happening. If you were writing private functions, you
would need to pass those in explicitly, which can get tedious and error-prone depending on what you're doing.

Be mindful of code readability - one of the main advantages of the pipe is that it makes it easy to
see what transformations are being applied to a value, and abusing anonymous functions can quickly
cause that to break down. Also remember about code reuse - if you feel like that transformation
could be useful elsewhere, it's better to extract it into a separate function. Keep that in
mind and you'll get the best of both worlds!
