{ pkgs, lib, ... }:

{
  dotenv.enable = true;

  languages.ruby.enable = true;

  # Use a specific Ruby version.
  # languages.ruby.version = "3.2.1";

  # Use a specific Ruby version from a .ruby-version file, compatible with rbenv.
  languages.ruby.versionFile = ./.ruby-version;

  languages.javascript.enable = true;

  # turn off C tooling if you do not intend to compile native extensions, enabled by default
  # languages.c.enable = false;

  services.postgres.enable = true;
  services.redis.enable = true;

  # processes.dev.exec = "pnpm run dev --tunnel ngrok";

  # processes.ngrok.exec = "ngrok http --domain=mathew-amp.ngrok.dev 3000";

  # Add required dependencies for macOS. These packages are usually provided as
  # part of the Xcode command line developer tools, in which case they can be
  # removed.
  # For more information, see the `--install` flag in `man xcode-select`.
  packages = lib.optionals pkgs.stdenv.isDarwin [
    pkgs.libllvm
    pkgs.openssl_3_0
  ];

  # env = {
  #   HOST=https://mathew-amp.ngrok.dev;
  #   APP_URL=https://mathew-amp.ngrok.dev;
  #   SERVER_PORT=3000;
  #   BACKEND_PORT=3000;
  # };
}