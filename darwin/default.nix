{ self, nix-darwin, home-manager, agenix, configuration, inputs,nix-homebrew, ... }:
{
  darwinConfigurations."dev" = nix-darwin.lib.darwinSystem {
    modules = [
      nix-homebrew.darwinModules.nix-homebrew
      {
        nix-homebrew = {
          # Install Homebrew under the default prefix
          enable = true;

          # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
          enableRosetta = true;

          # User owning the Homebrew prefix
          user = "dev";

          # Automatically migrate existing Homebrew installations
          autoMigrate = true;
        };
      }
      ../modules/apps.nix
      ../modules/homebrew
      ../modules/user.nix
      ../modules/nix-core.nix
      configuration
      home-manager.darwinModules.home-manager
      {
        #nixpkgs.overlays = [firefox-darwin.overlay];
        users.users.dev.home = "/Users/dev";
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          #extraSpecialArgs = specialArgs;
          users.dev = import ../homeManager;
          backupFileExtension = "backup";
          sharedModules = [
            agenix.homeManagerModules.default
          ];
        };
      }
    ];
    specialArgs = {inherit inputs;};
  };
}
