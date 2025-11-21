{
  users.users.root = {
    hashedPassword = "$6$7DVKnVBR3Twz5csb$jA702ECagSc6sr8a/ukimym1gZmXH2vuxfpmHrpa30kfp0QAo2farMqIAsvWgrfBvWOt62XryZ2jQ6jHjt69F0";
    openssh.authorizedKeys.keys = [
      (builtins.readFile ../../keys/ssh.pub)
    ];
  };
}
