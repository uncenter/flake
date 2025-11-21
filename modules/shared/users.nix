{
  users.users.uncenter = {
    openssh.authorizedKeys.keys = [
      (builtins.readFile ../../keys/ssh.pub)
    ];
  };
}
