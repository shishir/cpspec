module Cpspec
  class Middleware
    def initialize(app, env)
      @app = app
      @env = env
    end

    def call(env)
      if env["vm"].created? && env["vm"].vm.running?
        command = "ruby /vagrant/#{env["test.file"]}".strip

        env["vm"].ssh.execute do |ssh|
          env.ui.info "Running Test: #{env["test.file"]}"
          
          ssh.exec!("#{command}") do |channel, type, data|
            $stdout.print(data) if type != :exit_status
          end
          $stdout.puts
        end
      end
      @app.call(env)
    end
  end
end
