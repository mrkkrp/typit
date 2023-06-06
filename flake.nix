{
  inputs = {
    emacs-package-flake.url = "github:mrkkrp/emacs-package-flake";
  };
  outputs = { self, emacs-package-flake }:
    emacs-package-flake.lib.mkOutputs {
      name = "typit";
      srcDir = ./.;
      deps = ["f" "mmt"];
    };
}
