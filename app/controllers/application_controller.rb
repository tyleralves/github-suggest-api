class ApplicationController < ActionController::API
  include Response
  def index

      rout, wout = IO.pipe
      rerr, werr = IO.pipe

      pid = spawn("./clone.sh", :out => wout, :err => werr)
      _, status = Process.wait2(pid)

      wout.close
      werr.close

      output = rout.readlines
      .map{|item|
        item[/^\w+\s(\d+)/, 1]
      }
      .join(', ')

      json_response({status:status, output:output})
    end
end
