{
  users.users =
    let
      hashedPassword = "$6$7DVKnVBR3Twz5csb$jA702ECagSc6sr8a/ukimym1gZmXH2vuxfpmHrpa30kfp0QAo2farMqIAsvWgrfBvWOt62XryZ2jQ6jHjt69F0";
    in
    {
      uncenter = {
        inherit hashedPassword;
      };
      root = {
        inherit hashedPassword;
      };
    };
}
