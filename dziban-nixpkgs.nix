self: super:

{
  capnproto = super.callPackage ./libraries/capnproto.nix { };
  capnproto-rust = super.callPackage ~/proj/capnproto-rust/capnproto-rust.nix { };
}
