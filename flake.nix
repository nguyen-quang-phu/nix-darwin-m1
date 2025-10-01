{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
    agenix,
    }: let
      username = "dev";
      system = "aarch64-darwin"; # aarch64-darwin or x86_64-darwin
      hostname = "dev";
      useremail = "nqphu1998" + "@" + "gmail" + "." + "com";
      pkgs = nixpkgs.legacyPackages.${system};
      specialArgs =
        inputs
        // {
          inherit username hostname useremail;
        };
      configuration = {pkgs, ...}: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        environment.systemPackages = with pkgs; [
          vim
          vscode
          agenix.packages.${system}.default
        ];

        # Necessary for using flakes on this system.
        #nix.settings.experimental-features = "nix-command flakes";
        #nixpkgs.config.allowUnfree = true;

        # Enable alternative shell support in nix-darwin.
        # programs.fish.enable = true;

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 6;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";
      };
    in {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#dev
      darwinConfigurations."dev" = nix-darwin.lib.darwinSystem {
        modules = [
          ./modules/apps.nix
          ./modules/nix-core.nix
          configuration
          home-manager.darwinModules.home-manager
          {
            #nixpkgs.overlays = [firefox-darwin.overlay];
            users.users.dev.home = "/Users/dev";
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              #extraSpecialArgs = specialArgs;
              users.dev = import ./home;
              backupFileExtension = "backup";
            sharedModules = [
              agenix.homeManagerModules.default
            ];
            };
          }
        ];
        specialArgs = {inherit inputs;};
      };
    };
}
