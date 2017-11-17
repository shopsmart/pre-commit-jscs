=begin
Copyright 2016 Eric Agnew eric@bradsdeals.com

See the file LICENSE for copying permission.
=end

require 'pre-commit/error_list'
require 'pre-commit/checks/plugin'
require 'pre-commit/configuration/top_level'
require 'pre-commit/checks/shell'
require 'mkmf'
require 'find'

module PreCommit
  module Checks
    class Jscs < Shell
      include PreCommit::Configuration::TopLevel

      def self.description
        'Support for jscs linting'
      end

      def call(staged_files)
        return 'JSCS executable could not be located' if jscs_source.nil?

        # Check for .js files
        staged_files = staged_files.grep(/\.js$/)
        return if staged_files.empty?
        result = in_groups(staged_files).map do |files|
          run_check(files)
        end.compact

        result.empty? ? nil : result.join("\n")
      end

      def run_check(files)
        args = [jscs_source] + config_file_flag + files
        execute(args)
      end

      def config_file_flag
        config_file ? ['-c', config_file] : []
      end

      def alternate_config_file
        '.jscsrc'
      end

      def node_modules_bin
        @node_modules_bin ||= File.join(self.top_level, 'node_modules', '.bin')
      end

      # First look for jscs in the top_level
      def app_source
        @app_source ||= begin
          return unless File.directory?(node_modules_bin)
          Find.find(node_modules_bin) { |path| @app_source = path if path =~ /jscs$/ }
        end
      end

      # If jscs is not in the top_level see if its defined within the system
      def sys_source
        @sys_source ||= MakeMakefile.find_executable('jscs')
      end

      def jscs_source
        app_source || sys_source
      end
    end
  end
end

# Pevents MakeMakefile from generating log file
module Logging
  @logfile = File::NULL
end
