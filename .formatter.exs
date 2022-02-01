[
  import_deps: [:ecto, :phoenix, :surface],
  inputs: ["*.{ex,exs}", "priv/*/seeds.exs", "{config,lib,test}/**/*.{ex,exs}"],
  plugins: [Surface.Formatter.Plugin],
  subdirectories: ["priv/*/migrations"],
  surface_inputs: ["{lib,test}/**/*.{ex,exs,sface}"]
]
