# The script is adapted from the Homebrew core 'deps' command
require 'formula'
require 'ostruct'

def deps_for_formula(f, installed)
  if installed
    deps = f.deps.select do |dep|
      # This is how `brew missing` detects the dependencies for an installed formula
      if dep.optional? || dep.recommended?
        Tab.for_formula(f).with?(dep)
      else
        # build dependencies are listed, but they are not needed for using the formula
        # TODO: think about not listing them
        true
      end
    end
    dseps = deps.to_a
  else
    deps = f.deps.default
  end

  reqs = f.requirements

  all_deps = deps + reqs.select(&:default_formula?).map(&:to_dependency)
  all_deps.map(&:to_formula)
end

def puts_deps(formulae, installed)
  formulae.each { |f| puts "#{f.name}: #{deps_for_formula(f, installed) * " "}" }
end

mode = OpenStruct.new(
  :installed?  => ARGV.include?('--installed'),
  :all?        => ARGV.include?('--all'),
)

if mode.installed?
  puts_deps Formula.installed, true
elsif mode.all?
  puts_deps Formula, false
end
