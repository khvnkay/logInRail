require '/docker-entrypoint/common.rb'

RAILS_ROOT = Pathname.new "/rails"

def main 
  create_prod_user home: "/data/PROD_USER_NAME"
  thor_tasks
  ruby = `which ruby`
  do_cmd [
    {cmd: "chown -R #{PROD_USER_NAME}.#{PROD_USER_NAME} #{RAILS_ROOT.join 'tmp'}"}, 
    {cmd: "rm -rf #{RAILS_ROOT.join 'tmp/pids'}"}, 
    {cmd: "setcap cap_net_bind_service=+ep #{ruby}", desc: "Give Safe User Permission To Use Port 80"}
  ]

end

if __FILE__ == $0
  main 
  main_exec {
    "runuser #{PROD_USER_NAME} -c 'rails s -b 0.0.0.0 -p 80'"
  }
end