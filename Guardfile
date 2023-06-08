guard :shell do
    watch(%r{^app/assets/.*})
    callback(:run_on_changes_begin) do
      `bundle exec rake assets:precompile`
    end
  end
  