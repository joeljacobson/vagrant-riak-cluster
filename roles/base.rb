name "base"
description "Base role."
run_list(
  "recipe[apt]",
  "recipe[ntp]",
  "recipe[nmap]",
  "recipe[htop]",
  "recipe[openssh]",
  "recipe[sudo]"
)
default_attributes(
  "authorization" => {
    "sudo" => {
      "groups" => [ "sudo" ],
      "passwordless" => true
    }
  },
  "openssh" => {
    "server" => {
      "password_authentication" => "no"
    }
  }
)
