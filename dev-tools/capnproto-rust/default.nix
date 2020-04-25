{ sources ? import ./nix/sources.nix }:

let
  dziban-nixpkgs = import ~/proj/dziban-nixpkgs/dziban-nixpkgs.nix;
  pkgs = import sources.nixpkgs { };

  rust = import ./nix/rust.nix { inherit sources; };

  naersk = pkgs.callPackage sources.naersk {
    rustc = rust;
    cargo = rust;
  };

  src = pkgs.fetchgit {
    url = "git://github.com/capnproto/capnproto-rust.git";
    rev = "3e77df78d341b46ebe2ea74467ca40244c4056ac";
    sha256 = "122jk36iqd00v28f7zcpi49n60b4qxy2zb8dz89a8nbfmvnsd4ap";
  };

in naersk.buildPackage {
  inherit src;
  remapPathPrefix = true;
}
