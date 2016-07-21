class RemindrrGenerator < Rails::Generators::Base
  source_root File.expand_path('..', __FILE__)

  def create_remindrr_initializer
    copy_file 'initializer.rb', 'config/initializers/remindrr.rb'
  end
end
