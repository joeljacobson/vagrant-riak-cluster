lib = File.join(Chef::Config.file_cache_path, "lib")
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "erlang_template_helper"

class ::String
  include Eth::Erlang::String
end

class ::Array
  include Eth::Erlang::Array
end

name "riak"
description "Role for Riak nodes."
run_list(
  "recipe[riak]"
)
