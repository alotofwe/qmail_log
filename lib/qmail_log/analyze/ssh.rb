module QmailLog
  module Analyze
    class SSH < Base
      def run path, host, ssh_options = {}
        QmailLog::SSH::Configure.backend(host, ssh_options)
        @runner = Specinfra::Runner

        raise Errno::ENOENT unless @runner.check_file_is_file(path) or @runner.check_file_is_directory(path)

        files(path).each do |file|
          @runner.get_file_content(file).stdout.split("\n").each do |log|
            QmailLog::Analyze::Analyzer.analyze(log, @results, @qid_from_did, @memory)
          end
        end
      end

      protected

      def files path
        @runner.run_command("find #{path} -type f -exec ls -rt '{}' +").stdout.split("\n")
      end
    end
  end
end
