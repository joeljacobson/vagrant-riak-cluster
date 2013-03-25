lib = File.join(Chef::Config.file_cache_path, "lib")
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "erlang_template_helper"

name "riak"
description "Role for Riak nodes."
run_list(
  "recipe[riak]"
)
