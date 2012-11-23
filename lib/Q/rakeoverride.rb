# This extends the rake TaskManager with the
# possibility of overriding predefined tasks
# to call the original, just append original
# after a colon to its name.
Rake::TaskManager.class_eval do
  def alias_task(fq_name)
    new_name = "#{fq_name}:original"
    @tasks[new_name] = @tasks.delete(fq_name)
  end
end

# This functions provide the overriding for
# the caller, usage:
# override_task (name, ...) do ... end
def override_task(*args, &block)
  name, params, deps = Rake.application.resolve_args(args.dup)
  fq_name = Rake.application.instance_variable_get(:@scope).dup.push(name).join(':')
  Rake.application.alias_task(fq_name)
  Rake::Task.define_task(*args, &block)
end


