module Cpspec
  class Middleware
    def initialize(app, env)
      @app = app
      @env = env
    end

    def call(env)
      files = Dir.glob("test/*.rb")
      if env["vm"].created? && env["vm"].vm.running?
        files.each do |file|
          command = "ruby /vagrant/#{file}".strip

          env["vm"].ssh.execute do |ssh|
            env.ui.info "Running Test: #{file}"

            ssh.exec!("#{command}") do |channel, type, data|
              $stdout.print(data) if type != :exit_status
            end
            $stdout.puts
          end
        end
      end
      @app.call(env)
    end
  end
end
