# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

def git_ref
  `git rev-parse --short HEAD`.strip
end
