{
config,
pkgs,
...
}: {
  age = {
    identityPaths = [ "/Users/dev/.ssh/id_rsa" ];
    secrets = {
      mcp.file = ../../serects/mcp.age;
    };
  };
}
