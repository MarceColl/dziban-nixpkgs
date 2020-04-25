{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "capnproto";
  version = "0.8.0";

  src = fetchurl {
    url = "https://capnproto.org/capnproto-c++-${version}.tar.gz";
    sha256 = "d1f40e47574c65700f0ec98bf66729378efabe3c72bc0cda795037498541c10d";
  };

  meta = with stdenv.lib; {
    homepage    = "http://kentonv.github.io/capnproto";
    description = "Cap'n Proto cerealization protocol";
    longDescription = ''
      Cap’n Proto is an insanely fast data interchange format and
      capability-based RPC system. Think JSON, except binary. Or think Protocol
      Buffers, except faster.
    '';
    license     = licenses.bsd2;
    platforms   = platforms.all;
  };
}
