=begin
Copyright 2016 Eric Agnew eric@bradsdeals.com

See the file LICENSE for copying permission.
=end

require 'pre-commit/error_list'
require 'pre-commit/checks/plugin'

module PreCommit
  module Checks
    class Jscs < Shell

      def self.description
        "Support for jscs linting"
      end

      def call(staged_files)
        staged_files = staged_files.grep(/\.js$/)
        return if staged_files.empty?

        result =
        in_groups(staged_files).map do |files|
          args = %w{jscs} + files
          execute(args)
        end.compact

        result.empty? ? nil : result.join("\n")
      end

      def config_file_flag
        config_file ? ['--preset', config_file] : []
      end

    end
  end
end
